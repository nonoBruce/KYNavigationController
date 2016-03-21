//
//  KYNavigationViewController.m
//  KYNavigationController
//
//  Created by bruce on 16/3/18.
//  Copyright © 2016年 KY. All rights reserved.
//

#import "KYNavigationViewController.h"

#define KYSysCurrentVersion         ([[[UIDevice currentDevice] systemVersion] floatValue])
#define KYBkColorNavigaion          ([UIColor colorWithRed:0.204 green:0.722 blue:0.918 alpha:1])


@interface KYNavigationViewController ()

@end

@implementation KYNavigationViewController

//- (instancetype)init {
//    if(self = [super init]) {
//        self.tabBarController
//    }
//    
//    return self;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavStyle];
    // Do any additional setup after loading the view.
    
    [self setNavigationBack];
}


-(instancetype)initWithRootViewController:(UIViewController *)rootViewController {

    
    self = [super initWithRootViewController:rootViewController];
    
    if (self) {
        NSString *title         = nil;
        UIImage *image         = nil;
        UIImage *selectedImage = nil;
        
        if ([rootViewController isKindOfClass:[HomeViewController class]]) {
            title         = @"消息";
            image         = [UIImage imageNamed:@"tab_recent_nor"];
            selectedImage = [UIImage imageNamed:@"tab_recent_press"];
            
        }else  if ([rootViewController isKindOfClass:[DiscoverViewController class]]) {
//                title         = @"Discover";
            image         = [UIImage imageNamed:@"tab_buddy_nor"];
            selectedImage = [UIImage imageNamed:@"tab_buddy_press"];
            
        }else  if ([rootViewController isKindOfClass:[MessageViewController class]]) {
            title         = @"Message";
            image         = [UIImage imageNamed:@"tab_qworld_nor"];
            selectedImage = [UIImage imageNamed:@"tab_qworld_press"];
            
        }
//        [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        
//        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:image tag:0];
        //iOS7 and Later
        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:title image:image selectedImage:selectedImage];
        
        //---改变UITabBarItem的字体和颜色
        NSDictionary *AttributeNormalDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor grayColor], NSForegroundColorAttributeName,
                                      [UIFont fontWithName:@"Helvetica" size:10.0f], NSFontAttributeName,
                                            nil];
        [[UITabBarItem appearance] setTitleTextAttributes:AttributeNormalDic forState:UIControlStateNormal];
        
        
        NSDictionary *AttributeSelectedDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor orangeColor], NSForegroundColorAttributeName,
                                      [UIFont fontWithName:@"Helvetica" size:10.0], NSFontAttributeName,
                                              nil];
        [[UITabBarItem appearance] setTitleTextAttributes:AttributeSelectedDic forState:UIControlStateSelected];

        //图片是直接设置了
        //没有文字的情况下设置图片居中
        if(title == nil){
            item.imageInsets=UIEdgeInsetsMake(6, 0, -6, 0);
        }
        
        
        self.tabBarItem = item;
    }
    
    return self;
}


- (void)setupNavStyle {
    UIColor *BkColor = KYBkColorNavigaion;
    if (KYSysCurrentVersion < 7.0f) {
        [self.navigationBar setBackgroundImage:[[KYNavigationViewController CreateImageWithColor:BkColor] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)] forBarMetrics:UIBarMetricsDefault];
        if (KYSysCurrentVersion > 6.f) {
            //去掉导航栏下边的投影
            self.navigationBar.shadowImage = [[KYNavigationViewController CreateImageWithColor:[UIColor clearColor]] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
        }
    }else {
        [self.navigationBar setBackgroundImage:[[KYNavigationViewController CreateImageWithColor:BkColor] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 1, 5, 1)] forBarMetrics:UIBarMetricsDefault];
        self.navigationBar.tintColor = [UIColor whiteColor];
        //去掉导航栏下边的投影
        self.navigationBar.shadowImage = [[KYNavigationViewController CreateImageWithColor:[UIColor clearColor]] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
    }
    self.navigationBar.barStyle = UIBarStyleBlack;
}

//color to image
+ (UIImage *)CreateImageWithColor: (UIColor *) color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//修改返回图标的图片，在这边修改可以直接保留手势返回
//注意图片要正方形，不然会偏移，不居中
- (void)setNavigationBack{
    
    UINavigationBar * navigationBar = [UINavigationBar appearance];
    
    //返回按钮的箭头颜色
//    [navigationBar setTintColor:[UIColor greenColor]];
    
    //设置返回样式图片
    
    UIImage *image = [UIImage imageNamed:@"back_nor"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

//    iOS7之后如果要定制这个返回图片，需要下面2个值都设置
//    Note: These properties must both be set if you want to customize the back indicator image.
    navigationBar.backIndicatorImage = image;
    navigationBar.backIndicatorTransitionMaskImage = image;
    
}

#pragma mark - 返回item
- (UITabBarItem *)barButtonItem:(KYBarButtonType )type {
    
    return nil;
}


- (NSArray *)barButtonItems:(KYBarButtonType )type {
    
    return nil;
}

@end
