//
//  NavItem.h
//  my-meituan
//
//  Created by robin young on 16/3/5.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavItem : UIView
+ (instancetype)makeItem;

- (void)addtarget:(id)target action:(SEL)action;
@end
