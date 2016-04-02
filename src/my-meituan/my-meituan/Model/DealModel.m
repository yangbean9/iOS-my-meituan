//
//  DealModel.m
//  my-meituan
//
//  Created by robin young on 16/4/1.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "DealModel.h"

@implementation DealModel


- (NSArray *)asignModelWithDict:(NSDictionary *)dict{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    NSArray *dictArray = [dict objectForKey:@"deals"];
    for (NSDictionary *dict in dictArray) {
        DealModel *md = [[DealModel alloc]init];
        md.categories = dict[@"categories"];
        md.city = dict[@"city"];
        md.current_price = dict[@"current_price"];
        md.deal_url = dict[@"deal_url"];
        md.Description = dict[@"description"];
        md.image_url = dict[@"image_url"];
        md.s_image_url = dict[@"s_image_url"];
        md.list_price = dict[@"list_price"];
        md.purchase_deadline = dict[@"purchase_deadline"];
        md.title = dict[@"title"];
        [arr addObject:md];
    }
    return arr;
}


@end
