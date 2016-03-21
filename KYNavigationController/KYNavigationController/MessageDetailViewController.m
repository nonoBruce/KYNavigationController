//
//  MessageDetailViewController.m
//  KYNavigationController
//
//  Created by bruce on 16/3/21.
//  Copyright © 2016年 KY. All rights reserved.
//
//
//  重新设置侧滑手势的代理，并手动管理
//
//
//
#import "MessageDetailViewController.h"

@implementation MessageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"MessageDetail";
    
    
    //定制了一个返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 65, 40);
    [backBtn setImage:[UIImage imageNamed:@"back_nor"] forState:UIControlStateNormal];
//    [backBtn setImage:[UIImage imageNamed:@"back_nor"] forState:UIControlStateSelected];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 6, 0, 0)];//稍微调整下文字图片间距
//    backBtn.imageView.backgroundColor = [UIColor redColor];
    
    [backBtn addTarget:self action:@selector(leftItemAction:) forControlEvents:UIControlEventTouchUpInside];
//    [backBtn setBackgroundColor:[UIColor greenColor]];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -15;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    self.navigationItem.leftBarButtonItems = [[NSArray alloc] initWithObjects:negativeSpacer, leftItem, nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action

- (void)leftItemAction:(UIBarButtonItem *)item {
    NSLog(@"leftItemAction");
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
