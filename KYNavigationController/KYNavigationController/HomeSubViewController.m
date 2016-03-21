//
//  HomeSubViewController.m
//  KYNavigationController
//
//  Created by bruce on 16/3/19.
//  Copyright © 2016年 KY. All rights reserved.
//
//
//
//  1、修改返回按钮
//  2、添加右边按钮
//
//
#import "HomeSubViewController.h"

@interface HomeSubViewController ()

@end

@implementation HomeSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"UITabBar";

    self.view.backgroundColor = [UIColor whiteColor];
    
    //右边按钮
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"右边按钮"
//                                                                 style:UIBarButtonItemStyleDone
//                                                                target:self
//                                                                action:@selector(rightItem)];
//    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    //右边添加多个按钮
//    文字
//    UIBarButtonItem *cleanButton = [[UIBarButtonItem alloc] initWithTitle:@"清空"
//                                                                    style:UIBarButtonItemStylePlain
//                                                                   target:self
//                                                                   action:@selector(cleanTextView:)];
//    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"保存"
//                                                                   style:UIBarButtonItemStylePlain
//                                                                  target:self
//                                                                  action:@selector(saveTextView:)];
    
//    图片
//    UIBarButtonItem *cleanButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header_icon_single"]
//                                                      landscapeImagePhone:[UIImage imageNamed:@"header_icon_single_pressed"]
//                                                                    style:UIBarButtonItemStylePlain
//                                                                   target:self action:@selector(cleanTextView:)];
//                                    
//    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"aio_head_twocall"]
//                                                     landscapeImagePhone:[UIImage imageNamed:@"aio_head_twocall_pressed"]
//                                                                   style:UIBarButtonItemStylePlain
//                                                                  target:self action:@selector(saveTextView:)];
    
//    NSArray *buttonArray = [[NSArray alloc]initWithObjects:cleanButton,saveButton, nil];
//    self.navigationItem.rightBarButtonItems = buttonArray;
//    自定义按钮
    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    clearBtn.frame = CGRectMake(40, 0, 40, 40);
    [clearBtn setImage:[UIImage imageNamed:@"header_icon_single"] forState:UIControlStateNormal];
    [clearBtn setImage:[UIImage imageNamed:@"header_icon_single_pressed"] forState:UIControlStateSelected];
    [clearBtn addTarget:self action:@selector(cleanTextView:) forControlEvents:UIControlEventTouchUpInside];
//    clearBtn.backgroundColor = [UIColor greenColor];
    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(0, 0, 40, 40);
    [saveBtn setImage:[UIImage imageNamed:@"aio_head_twocall"] forState:UIControlStateNormal];
    [saveBtn setImage:[UIImage imageNamed:@"aio_head_twocall_pressed"] forState:UIControlStateSelected];
    [saveBtn addTarget:self action:@selector(saveTextView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *saveBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn1.frame = CGRectMake(80, 0, 40, 40);
    [saveBtn1 setImage:[UIImage imageNamed:@"aio_head_twocall"] forState:UIControlStateNormal];
    [saveBtn1 setImage:[UIImage imageNamed:@"aio_head_twocall_pressed"] forState:UIControlStateSelected];
    [saveBtn1 addTarget:self action:@selector(saveTextView:) forControlEvents:UIControlEventTouchUpInside];

    UIView *rightView = [[UIView alloc] init];
    rightView.frame = CGRectMake(-40, 0, 120, 40);
//    rightView.backgroundColor = [UIColor redColor];
    

    [rightView addSubview:clearBtn];
    [rightView addSubview:saveBtn];
    [rightView addSubview:saveBtn1];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -15;
    
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects:negativeSpacer, rightItem,nil] ;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - action
- (void)cleanTextView:(UIBarButtonItem *)item {
    NSLog(@"clear");
}

- (void)saveTextView:(UIBarButtonItem *)item {
    NSLog(@"save");
}



@end
