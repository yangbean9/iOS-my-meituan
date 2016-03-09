//
//  popView.m
//  my-meituan
//
//  Created by robin young on 16/3/5.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "popView.h"

@implementation popView

+ (popView *)makePopView{
    return [[[NSBundle mainBundle]loadNibNamed:@"popView" owner:self options:nil]firstObject];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
