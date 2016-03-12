//
//  SecondPopverViewController.m
//  my-meituan
//
//  Created by robin young on 16/3/10.
//  Copyright © 2016年 robin young. All rights reserved.
//

#import "SecondPopverViewController.h"
#import "ChangeCityViewController.h"
#import "MyNavController.h"

@interface SecondPopverViewController ()

- (IBAction)changeCityClick:(id)sender;

@end

@implementation SecondPopverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//这就切换城市点击事件
- (IBAction)changeCityClick:(id)sender {
    ChangeCityViewController *cvc = [[ChangeCityViewController alloc]initWithNibName:@"ChangeCityViewController" bundle:nil];
    MyNavController *nav = [[MyNavController alloc]initWithRootViewController:cvc];
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:nav animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
