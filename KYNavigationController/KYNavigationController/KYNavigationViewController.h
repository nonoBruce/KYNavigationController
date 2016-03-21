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

typedef NS_ENUM(NSInteger, KYBarButtonType) {
    KYBarButtonType_Common = 1,
};

@interface KYNavigationViewController : UINavigationController

- (UITabBarItem *)barButtonItem:(KYBarButtonType )type;


- (NSArray *)barButtonItems:(KYBarButtonType )type;

@end
