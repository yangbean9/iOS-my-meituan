//
//  FirstViewController.m
//  my-meituan
//
//  Created by robin young on 16/3/30.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "FirstViewController.h"
#import "NavItem.h"
#import "PopViewController.h"
#import "SecondPopverViewController.h"
#import "CityGroupsModel.h"
#import "CategoriyModel.h"
#import "DPAPI.h"

@interface FirstViewController ()<DPRequestDelegate>{
    UIBarButtonItem *firstItem;
    UIBarButtonItem *secondItem;
    UIBarButtonItem *thirdItem;
    
    NSString *_selectedCityName;
    NSString *_selectedCategory;
}

@end

@implementation FirstViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    return [self initWithCollectionViewLayout:layout];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self createNavBar];
    
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    //添加观察者
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(categoryChange:) name:@"categoryDidChanged" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(subCategoryChange:) name:@"subCategoryDidChanged" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cityChange:) name:@"cityDidChanged" object:nil];

    
}

- (void)categoryChange:(NSNotification*)noti{
    CategoriyModel *md = (CategoriyModel*)noti.userInfo[@"categoryModel"];
    NSLog(@"左表：%@",md.name);
        //发送网络请求
    [self createRequest];
}

- (void)subCategoryChange:(NSNotification*)noti{
    CategoriyModel *md = (CategoriyModel*)noti.userInfo[@"categoryModel"];
    NSString *selectedSubName = noti.userInfo[@"subCategoryName"];
    
    if (!md.subcategories.count) {
        _selectedCategory = md.name;
    }else{
        if ([selectedSubName isEqualToString:@"全部"]) {
            _selectedCategory = md.name;
        }else{
            _selectedCategory = selectedSubName;
        }
    }

    //发送网络请求
    [self createRequest];
}

- (void)cityChange:(NSNotification*)noti{
    _selectedCityName = noti.userInfo[@"cityName"];
    
    //发送网络请求
    [self createRequest];
}

#pragma mark - 网络请求
- (void)createRequest{
    DPAPI *api = [[DPAPI alloc]init];
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setValue:_selectedCityName forKey:@"city"];
    [params setValue:_selectedCategory forKey:@"category"];
    [api requestWithURL:@"v1/deal/find_deals" params:params delegate:self];
}

- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result{
    NSLog(@"%@",result);
}

- (void)request:(DPRequest *)request didFailWithError:(NSError *)error{
    NSLog(@"%@",error);
}


#pragma mark - 创建导航栏
- (void)createNavBar{
    //1. logo
    UIBarButtonItem *logo = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    //2. 3个UIbarButtonItem
    NavItem *first = [NavItem makeItem];
    [first addtarget:self action:@selector(firstClick)];
    NavItem *second = [NavItem makeItem];
    [second addtarget:self action:@selector(secondClick)];
    NavItem *third = [NavItem makeItem];
    [third addtarget:self action:@selector(thirdClick)];

    firstItem= [[UIBarButtonItem alloc]initWithCustomView:first];
    
    
    secondItem = [[UIBarButtonItem alloc]initWithCustomView:second];

    thirdItem = [[UIBarButtonItem alloc]initWithCustomView:third];
    self.navigationItem.leftBarButtonItems = @[logo,firstItem,secondItem,thirdItem];
}

#pragma mark - 点击事件
- (void)firstClick{
    [self createPopver];
}
- (void)secondClick{
    [self createSecondPopver];

}
- (void)thirdClick{
    NSLog(@"1");

}

#pragma mark - 第一个下拉菜单
- (void)createPopver{
    PopViewController *pvc = [[PopViewController alloc]init];
    UIPopoverController *pop = [[UIPopoverController alloc]initWithContentViewController:pvc];
    [pop presentPopoverFromBarButtonItem:firstItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

#pragma mark - 第二个下拉菜单
- (void)createSecondPopver{
    SecondPopverViewController *svc = [[SecondPopverViewController alloc]initWithNibName:@"SecondPopverViewController" bundle:nil];;
    UIPopoverController *pop = [[UIPopoverController alloc]initWithContentViewController:svc];
    [pop presentPopoverFromBarButtonItem:secondItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
