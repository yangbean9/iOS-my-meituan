//
//  MyLabel.m
//  my-meituan
//
//  Created by robin young on 16/4/7.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    /*
     1.获取到上下文CGContextRef
     2.设置画线的起点位置
     3.画线，并画到另一个点的位置
     4.渲染到屏幕上面
     */
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, rect.size.height/2);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height/2);
    CGContextStrokePath(context);
}


@end
