//
//  ChangeCityViewController.m
//  my-meituan
//
//  Created by robin young on 16/3/12.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "ChangeCityViewController.h"
#import "CityGroupsModel.h"

@interface ChangeCityViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray *_dataArray;
}

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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
