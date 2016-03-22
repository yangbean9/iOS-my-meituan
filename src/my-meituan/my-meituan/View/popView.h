//
//  popView.h
//  my-meituan
//
//  Created by robin young on 16/3/22.
//  Copyright © 2016年 robin young. All rights reserved.
//
// 1. 声明一个协议
// 2. 声明协议中的方法
// 3. 声明一个遵守协议的id类型的指针
// 4. 实现协议方法

#import <UIKit/UIKit.h>
@class popView;

@protocol MyPopviewDataSource <NSObject>

//制定协议方法

//left tablevie 行数
- (NSInteger)numberOfRowsInLeftTable:(popView *)popView;

//left 标题
- (NSString *)popView:(popView *)popView titleForRow:(int)row;

//left 图标
- (NSString *)popView:(popView *)popView imageForRow:(int)row;

//left 子数据
- (NSArray *)popView:(popView *)popView subDataForRow:(int)row;

@end

@interface popView : UIView

@property (nonatomic,strong)NSArray *categoryArr;

@property (nonatomic,assign)id<MyPopviewDataSource> dataSource;

+ (popView*)makePopView;

@end
