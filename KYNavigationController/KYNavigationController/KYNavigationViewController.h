//
//  KYNavigationViewController.h
//  KYNavigationController
//
//  Created by bruce on 16/3/18.
//  Copyright © 2016年 KY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "DiscoverViewController.h"
#import "MessageViewController.h"

//自定义的barButtonItems
typedef NS_ENUM(NSInteger, KYBarButtonType) {
    KYBarButtonType_NULL = 0,   //默认只有返回的
    KYBarButtonType_Back = 1,   //指定的返回
    
    KYBarButtonType_User = 2,   //
    KYBarButtonType_Call,   //
    KYBarButtonType_Save,   //
    KYBarButtonType_Clear,   //
    
//    定制类型
    KYBarButtonType_Costom = 10,//里面有多个视图
    
    KYBarButtonType_Costom2 = 15,

};

typedef void (^KYBarButtonBlock)(UIBarButtonItem *item);

@interface KYNavigationViewController : UINavigationController


@property(nonatomic, strong)KYBarButtonBlock barButtonBlock;

- (UIBarButtonItem *)barButtonItem:(KYBarButtonType )type andBarButtonBlock:(KYBarButtonBlock)block;

- (NSArray *)barButtonItems:(NSArray *)types andBarButtonBlock:(KYBarButtonBlock)block;

@end
