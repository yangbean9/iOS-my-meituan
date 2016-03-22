//
//  PopViewController.m
//  团购项目
//
//  Created by lb on 15/5/27.
//  Copyright (c) 2015年 lbcoder. All rights reserved.
//

#import "PopViewController.h"
#import "popView.h"
#import "CategoriyModel.h"

@interface PopViewController ()<MyPopviewDataSource>

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    popView *pop = [popView makePopView];
    [self.view addSubview:pop];
    pop.dataSource = self;
    pop.autoresizingMask = UIViewAutoresizingNone;
    self.preferredContentSize = CGSizeMake(pop.frame.size.width, pop.frame.size.height);
}

//获取到 第一个分类数据下拉菜单的模型数组
- (NSArray *)getData{
    CategoriyModel *md = [[CategoriyModel alloc]init];
    NSArray *categorieyArray = [md loadPlistData];
    return categorieyArray;
}


#pragma mark - popview dataSource
- (NSInteger)numberOfRowsInLeftTable:(popView *)popView{
    return [self getData].count;
}

- (NSString *)popView:(popView *)popView titleForRow:(int)row{
    return [[self getData][row]name];
}

- (NSString *)popView:(popView *)popView imageForRow:(int)row{
    return [[self getData][row]small_icon];
}

- (NSArray *)popView:(popView *)popView subDataForRow:(int)row{
    return [[self getData][row]subcategories];
}

@end
