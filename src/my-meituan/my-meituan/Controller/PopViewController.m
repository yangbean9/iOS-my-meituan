//
//  PopViewController.m
//  my-meituan
//
//  Created by robin young on 16/3/6.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "PopViewController.h"
#import "popView.h"
#import "CategoriyModel.h"

@interface PopViewController ()<MyPopviewDataSource,MyPopviewDelegate> {
     CategoriyModel *_seletedModel;
}

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    popView *pop = [popView makePopView];
    [self.view addSubview:pop];
    pop.dataSource = self;
    pop.delegate = self;
    pop.autoresizingMask = UIViewAutoresizingNone;
    self.preferredContentSize = CGSizeMake(pop.frame.size.width, pop.frame.size.height);
}

//获取到 第一个分类数据下拉菜单的模型数组
- (NSArray *)getData {
    CategoriyModel *md = [[CategoriyModel alloc]init];
    NSArray *categorieyArray = [md loadPlistData];
    return categorieyArray;
}


#pragma mark - popview dataSource
- (NSInteger)numberOfRowsInLeftTable:(popView *)popView {
    return [self getData].count;
}

- (NSString *)popView:(popView *)popView titleForRow:(int)row {
    return [[self getData][row]name];
}

- (NSString *)popView:(popView *)popView imageForRow:(int)row {
    return [[self getData][row]small_icon];
}

- (NSArray *)popView:(popView *)popView subDataForRow:(int)row {
    return [[self getData][row]subcategories];
}

#pragma mark - popview delegate
- (void)popView:(popView *)popView didSelectRowAtLeftTable:(int)row {
    //选择了popview的左侧表格
    NSArray *categoryArr = [self getData];
    _seletedModel = categoryArr[row];
    //有没有子数据
    if (!_seletedModel.subcategories.count) {
        //发送通知
        [[NSNotificationCenter defaultCenter]postNotificationName:@"categoryDidChanged" object:nil userInfo:@{@"categoryModel":_seletedModel}];
    }
}

- (void)popView:(popView *)popView didSelectRowAtRightTable:(int)row {
    NSArray *subArr = _seletedModel.subcategories;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"categoryDidChanged" object:nil userInfo:@{@"subCategoryName":subArr[row]}];
}

@end
