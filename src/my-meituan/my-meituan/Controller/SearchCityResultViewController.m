//
//  SearchCityResultViewController.m
//  my-meituan
//
//  Created by robin young on 16/3/30.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "SearchCityResultViewController.h"
#import "Cities.h"

@interface SearchCityResultViewController (){
    NSMutableArray *_searchResultArray;
}

@end

@implementation SearchCityResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)setSearchText:(NSString *)searchText{
    _searchText = [searchText lowercaseString];
    // 获取城市模型数组
    if (!_citiesArray) {
        _citiesArray = [Cities getCities];

    }
    _searchResultArray = [[NSMutableArray alloc]init];
    //遍历判断 获得数据
    for (Cities *city in _citiesArray) {
        if ([city.pinYinHead containsString:_searchText]||[city.pinYinHead containsString:_searchText]||[city.pinYin containsString:_searchText]) {
            [_searchResultArray addObject:city];
        }
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%d",_searchResultArray.count);
    return _searchResultArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *str = @"searchCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    Cities *city = [_searchResultArray objectAtIndex:indexPath.row];
    cell.textLabel.text = city.name;
    return cell;
}

@end
