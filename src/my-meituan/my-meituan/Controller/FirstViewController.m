//
//  FirstViewController.m
//  my-meituan
//
//  Created by robin young on 16/3/5.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "FirstViewController.h"
#import "NavItem.h"
#import "PopViewController.h"
#import "SecondPopverViewController.h"

@interface FirstViewController () {
    UIBarButtonItem *item1;
    UIBarButtonItem *item2;
    UIBarButtonItem *item3;
}
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
    NavItem *nav1 = [NavItem makeItem];
    NavItem *nav2 = [NavItem makeItem];
    NavItem *nav3 = [NavItem makeItem];
    [nav1 addtarget:self action:@selector(item1click)];
    [nav2 addtarget:self action:@selector(item2click)];
    [nav3 addtarget:self action:@selector(item3click)];
    
    item1 = [[UIBarButtonItem alloc]initWithCustomView:nav1];
    item2 = [[UIBarButtonItem alloc]initWithCustomView:nav2];
    item3 = [[UIBarButtonItem alloc]initWithCustomView:nav3];
    self.navigationItem.leftBarButtonItems = @[logo,item1,item2,item3];
    
}

#pragma mark -菜单栏点击事件


- (void) item1click {
    NSLog(@"item1");
    [self createPopver];
}

- (void) item2click {
    NSLog(@"item2");
    [self createSecondPopver];
}

- (void) item3click {
    NSLog(@"item3");
}

#pragma mark -创建下拉菜单

- (void) createPopver {
    PopViewController *pvc = [[PopViewController alloc]init];
    UIPopoverController *popc = [[UIPopoverController alloc]initWithContentViewController:pvc];
    [popc presentPopoverFromBarButtonItem:item1 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

#pragma mark - 第二个下拉菜单
- (void)createSecondPopver {
    SecondPopverViewController *svc = [[SecondPopverViewController alloc]initWithNibName:@"SecondPopverViewController" bundle:nil];
    UIPopoverController *pop = [[UIPopoverController alloc]initWithContentViewController:svc];
    [pop presentPopoverFromBarButtonItem:item2 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

@end
