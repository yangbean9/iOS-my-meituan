//
//  NavItem.m
//  my-meituan
//
//  Created by robin young on 16/3/5.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "NavItem.h"
@interface NavItem ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation NavItem

+(instancetype)makeItem {
    return [[[NSBundle mainBundle]loadNibNamed:@"NavItem" owner:self options:nil]firstObject];
    
}

- (void)addtarget:(id)target action:(SEL)action {
    [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
}

@end
