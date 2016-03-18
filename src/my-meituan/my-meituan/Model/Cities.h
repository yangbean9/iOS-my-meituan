//
//  Cities.h
//  my-meituan
//
//  Created by robin young on 16/3/18.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cities : NSObject

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *pinYin;
@property (nonatomic,copy)NSString *pinYinHead;
@property (nonatomic,strong)NSArray *region;


+ (NSArray *)getCities;

@end
