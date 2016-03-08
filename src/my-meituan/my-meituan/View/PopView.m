//
//  PopView.m
//  my-meituan
//
//  Created by robin young on 16/3/7.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "PopView.h"
@interface PopView ()
@property (strong, nonatomic) IBOutlet UITableView *leftTv;
@property (strong, nonatomic) IBOutlet UITableView *rightTv;

@end
@implementation PopView

+ (PopView *)makePopView {
    return [[[NSBundle mainBundle]loadNibNamed:@"PopView" owner:self options:nil]firstObject];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
