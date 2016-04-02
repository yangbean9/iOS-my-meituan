//
//  MainCollectionViewCell.h
//  my-meituan
//
//  Created by robin young on 16/4/2.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DealModel;

@interface MainCollectionViewCell : UICollectionViewCell

- (void)showUIWithModel:(DealModel *)model;


@end
