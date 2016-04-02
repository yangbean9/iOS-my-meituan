//
//  MainCollectionViewCell.m
//  my-meituan
//
//  Created by robin young on 16/4/2.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "MainCollectionViewCell.h"
#import "DealModel.h"

@interface MainCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;

@property (weak, nonatomic) IBOutlet UILabel *salesNumLabel;



@end

@implementation MainCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)showUIWithModel:(DealModel *)model{
    self.titleLabel.text = model.title;
    self.detailLabel.text = model.Description;
}

@end
