//
//  ChangeCityViewController.m
//  my-meituan
//
//  Created by robin young on 16/3/30.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "ChangeCityViewController.h"
#import "CityGroupsModel.h"
#import "SearchCityResultViewController.h"
#import "UIView+AutoLayout.h"

@interface ChangeCityViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>{
    NSArray *_dataArray;
}
@property (weak, nonatomic) IBOutlet UIView *coverView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) SearchCityResultViewController *searchResultVC;

@end

@implementation ChangeCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    self.title = @"切换城市";
    //关闭按钮
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_navigation_close"] style:UIBarButtonItemStyleDone target:self action:@selector(backToVC)];
    self.navigationItem.leftBarButtonItem = item;
    
    //获取数据源
    CityGroupsModel *md  = [[CityGroupsModel alloc]init];
    _dataArray = [md getModelArray];
}

- (void)backToVC{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_dataArray objectAtIndex:section] cities].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"tableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    CityGroupsModel *md = [_dataArray objectAtIndex:indexPath.section];
    cell.textLabel.text = md.cities[indexPath.row];
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CityGroupsModel *md = [_dataArray objectAtIndex:section];
    return md.title;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CityGroupsModel *md = [_dataArray objectAtIndex:indexPath.section];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"cityDidChanged" object:nil userInfo:@{@"cityName":md.cities[indexPath.row]}];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UISearchBar delegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    self.coverView.hidden = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    self.coverView.hidden = YES;
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length) {
        self.searchResultVC.view.hidden = NO;
        self.searchResultVC.searchText = searchText;
    }
    else{
        self.searchResultVC.view.hidden = YES;

    }
}

#pragma mark - 创建搜索结果控制器
- (SearchCityResultViewController *)searchResultVC{
    //懒加在
    if (!_searchResultVC) {
        self.searchResultVC = [[SearchCityResultViewController alloc]init];
        //将搜索结果VC添加到当前控制器中
        [self.view addSubview:_searchResultVC.view];
        //添加约束 设置搜索结果控制器的尺寸位置
        [self.searchResultVC.view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        //让searchResultVC的顶部 贴着搜索框的底部  不遮盖住搜索框
        [self.searchResultVC.view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.searchBar];
        
        
    }
    return _searchResultVC;
}


@end
