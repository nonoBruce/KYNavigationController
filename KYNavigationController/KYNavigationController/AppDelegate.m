//
//  AppDelegate.m
//  KYNavigationController
//
//  Created by bruce on 16/3/18.
//  Copyright © 2016年 KY. All rights reserved.
//

#import "AppDelegate.h"

#import "KYNavigationViewController.h"

@interface AppDelegate ()

@property(nonatomic,strong) UITabBarController *mainTabBarController;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = self.mainTabBarController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(UITabBarController *)mainTabBarController{
    
    if (_mainTabBarController) {
        return _mainTabBarController;
    }
    _mainTabBarController = [[UITabBarController alloc]init];
    
    static  NSString *storyboardName =@"Main";//无后缀.storyboard
    UIStoryboard *storyboard = [UIStoryboard  storyboardWithName:storyboardName  bundle:nil];
    
    HomeViewController *home = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    DiscoverViewController *discover = [[DiscoverViewController alloc]init];
    MessageViewController *message = [storyboard instantiateViewControllerWithIdentifier:@"MessageViewController"];;
    
    [_mainTabBarController setViewControllers:@[[[KYNavigationViewController alloc]initWithRootViewController:home],[[KYNavigationViewController alloc]initWithRootViewController:discover],[[KYNavigationViewController alloc]initWithRootViewController:message]]];
    
    //修改TabbarController.tabBar的背景颜色
//    UIView *tabBgView = [[UIView alloc] initWithFrame:_mainTabBarController.tabBar.bounds];
//    tabBgView.backgroundColor = [UIColor greenColor];
//    [_mainTabBarController.tabBar insertSubview:tabBgView atIndex:0];
    
    return _mainTabBarController;
}

@end
