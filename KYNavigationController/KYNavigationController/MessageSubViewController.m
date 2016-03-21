//
//  MessageSubViewController.m
//  KYNavigationController
//
//  Created by bruce on 16/3/21.
//  Copyright © 2016年 KY. All rights reserved.
//

#import "MessageSubViewController.h"

@interface MessageSubViewController()

@end


@implementation MessageSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"MessageDetail";
    
    //右边按钮
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"左边按钮"
                                                                 style:UIBarButtonItemStyleDone
                                                                target:self
                                                               action:@selector(leftItemAction:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
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
