//
//  FirstViewController.m
//  my-meituan
//
//  Created by robin young on 16/3/5.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "FirstViewController.h"
#import "NavItem.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (instancetype)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self createNavBar];
}

#pragma mark -创建导航栏
- (void)createNavBar {
    //logo
    UIBarButtonItem *logo = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] landscapeImagePhone:nil style:UIBarButtonItemStyleDone target:nil action:nil];
//    self.navigationItem.leftBarButtonItem = logo;
    //3个UIBarButtonItem
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:[NavItem makeItem]];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithCustomView:[NavItem makeItem]];
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc]initWithCustomView:[NavItem makeItem]];
    self.navigationItem.leftBarButtonItems = @[logo,item1,item2,item3];
    
}
@end
