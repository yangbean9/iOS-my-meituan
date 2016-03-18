//
//  Cities.m
//  my-meituan
//
//  Created by robin young on 16/3/18.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "Cities.h"

@implementation Cities

+ (NSArray *)getCities{
    //1.获取plist文件的地址
    NSString *path = [[NSBundle mainBundle]pathForResource:@"cities.plist" ofType:nil];
    //2.加载plist文件为数组
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
    //3.遍历数组 字典转模型
    NSMutableArray *modelArray = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in plistArray) {
        Cities *cityModel = [[Cities alloc]init];
        cityModel.name = [dict objectForKey:@"name"];
        cityModel.pinYin = [dict objectForKey:@"pinYin"];
        cityModel.pinYinHead = [dict objectForKey:@"pinYinHead"];
        cityModel.region = [dict objectForKey:@"region"];
        [modelArray addObject:cityModel];
    }
    return modelArray;
}

@end
