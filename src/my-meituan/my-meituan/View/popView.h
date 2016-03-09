//
//  popView.h
//  my-meituan
//
//  Created by robin young on 16/3/9.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface popView : UIView

@property (nonatomic,strong)NSArray *categoryArr;


+ (popView*)makePopView;

@end
