//
//  LeftBarUIViewController.m
//  KYNavigationController
//
//  Created by bruce on 16/3/21.
//  Copyright © 2016年 KY. All rights reserved.
//

#import "LeftBarUIViewController.h"

@implementation LeftBarUIViewController

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"定制左边左边左边左边左边左边左边的BarButton";

    
//    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(00, 10, 60,  30)];
//    
//    [rightButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [rightButton setBackgroundImage:[UIImage imageNamed:@"header_leftbtn_nor"] forState:UIControlStateNormal];
//    
////    [rightButton setTitle:@"退出" forState:UIControlStateNormal];
//    
//    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
//    
//    self.navigationItem.leftBarButtonItem = leftBarButton;
}

- (void)backAction:(UITabBarItem *)item {
    NSLog(@"back");
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
