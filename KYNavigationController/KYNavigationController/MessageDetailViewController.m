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
#import "KYNavigationViewController.h"

@implementation MessageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"MessageDetail";
    
    
    KYNavigationViewController *nav = (KYNavigationViewController *)self.navigationController;
    NSArray *array = [[NSArray alloc] initWithObjects:
                      [NSNumber numberWithInteger:KYBarButtonType_Back],nil];
    self.navigationItem.rightBarButtonItems = [nav barButtonItems:array andBarButtonBlock:^(UIBarButtonItem *item) {
        switch (item.tag) {
            case KYBarButtonType_Back:{
                NSLog(@"KYBarButtonType_Back click");
                break;
            }
            default:
                break;
        }
    }];
    
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
