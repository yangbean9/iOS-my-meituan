//
//  SearchCityResultViewController.h
//  my-meituan
//
//  Created by robin young on 16/3/30.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchCityResultViewController : UITableViewController

@property (nonatomic,copy)NSString *searchText;

@property (nonatomic,strong)NSArray *citiesArray;

@end
