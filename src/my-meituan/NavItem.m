//
//  NavItem.m
//  my-meituan
//
//  Created by robin young on 16/3/5.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "NavItem.h"

@implementation NavItem

+(instancetype)makeItem {
    return [[[NSBundle mainBundle]loadNibNamed:@"NavItem" owner:self options:nil]firstObject];
    
}

@end
