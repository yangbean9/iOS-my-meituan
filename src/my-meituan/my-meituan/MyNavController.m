//
//  MyNavController.m
//  my-meituan
//
//  Created by robin young on 16/3/5.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "MyNavController.h"


@implementation MyNavController


+ (void)initialize {
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"] forBarMetrics:UIBarMetricsDefault];
    
}

@end
