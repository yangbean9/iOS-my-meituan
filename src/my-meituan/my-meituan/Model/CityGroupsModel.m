//
//  CityGroupsModel.m
//  my-meituan
//
//  Created by robin young on 16/3/10.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "CityGroupsModel.h"

@implementation CityGroupsModel{
    NSArray *_plistArray;
}

- (instancetype)init{
    if (self = [super init]) {
        [self loadPlist];
    }
    return self;
}

- (void)loadPlist{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"cityGroups.plist" ofType:nil];
    _plistArray = [NSArray arrayWithContentsOfFile:path];
    
}

- (NSArray *)getModelArray{
    NSMutableArray *dataArray = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in _plistArray) {
        CityGroupsModel *md = [[CityGroupsModel alloc]init];
        md.title = [dict objectForKey:@"title"];
        md.cities = [dict objectForKey:@"cities"];
        [dataArray addObject:md];
    }
    return dataArray;
}
@end