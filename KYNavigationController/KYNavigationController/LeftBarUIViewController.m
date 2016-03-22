//
//  LeftBarUIViewController.m
//  KYNavigationController
//
//  Created by bruce on 16/3/21.
//  Copyright © 2016年 KY. All rights reserved.
//

#import "LeftBarUIViewController.h"
#import "KYNavigationViewController.h"
@implementation LeftBarUIViewController

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"定制左边";

    KYNavigationViewController *nav = (KYNavigationViewController *)self.navigationController;
    NSArray *array = [[NSArray alloc] initWithObjects:
                      [NSNumber numberWithInteger:KYBarButtonType_User],
                      [NSNumber numberWithInteger:KYBarButtonType_Call],nil];
    self.navigationItem.rightBarButtonItems = [nav barButtonItems:array andBarButtonBlock:^(UIBarButtonItem *item) {
        switch (item.tag) {
            case KYBarButtonType_User:{
                NSLog(@"KYBarButtonType_Clear click");
                break;
            }
            case KYBarButtonType_Call:{
                NSLog(@"KYBarButtonType_Save click");
                break;
            }
            default:
                break;
        }
    }];
    
}

- (void)backAction:(UITabBarItem *)item {
    NSLog(@"back");
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
