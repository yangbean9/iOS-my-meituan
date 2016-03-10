//
//  CityGroupsModel.h
//  my-meituan
//
//  Created by robin young on 16/3/10.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityGroupsModel : NSObject

//属性 :title字符串   城市数组

@property (nonatomic,strong)NSArray *cities;
@property (nonatomic,copy)NSString *title;

- (NSArray *)getModelArray;

@end
