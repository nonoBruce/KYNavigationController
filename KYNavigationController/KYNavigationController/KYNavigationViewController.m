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


@interface KYNavigationViewController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property(nonatomic, weak) UIViewController *currentShowVC;

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
    
    [self setNavigationBack];//这个只修改返回图片
//    [self setNavigationBack1];//只含有图片的
}


-(instancetype)initWithRootViewController:(UIViewController *)rootViewController {

    
    self = [super initWithRootViewController:rootViewController];
    
    //手势操作-- start
    self.interactivePopGestureRecognizer.delegate = self;
    self.delegate = self;
    //手势操作-- end
    
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

//设置只有图片
- (void)setNavigationBack1 {
    UINavigationBar * navigationBar = [UINavigationBar appearance];
    
    //返回按钮的箭头颜色
    //    [navigationBar setTintColor:[UIColor greenColor]];
    
    //设置返回样式图片
    
    UIImage *image = [UIImage imageNamed:@"leftBackButton"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //    iOS7之后如果要定制这个返回图片，需要下面2个值都设置
    //    Note: These properties must both be set if you want to customize the back indicator image.
    navigationBar.backIndicatorImage = image;
    navigationBar.backIndicatorTransitionMaskImage = image;
    
    //把标题移到看不到的地方，
    UIBarButtonItem *buttonItem = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil];
    UIOffset offset;
    offset.horizontal = - 100;
    offset.vertical =  - 100;
    [buttonItem setBackButtonTitlePositionAdjustment:offset forBarMetrics:UIBarMetricsDefault];

}

- (void)setNavigationBack2 {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 60, 40);
    backButton.backgroundColor = [UIColor redColor];
    [backButton setImage:[UIImage imageNamed:@"leftBackButton"] forState:UIControlStateNormal];
    //对按钮的个性化设定
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//    self.navigationItem.leftBarButtonItem = barItem; //侧滑手势失效
    self.navigationItem.backBarButtonItem = barItem; //不影响侧滑手势
}

//参考地址：http://www.jianshu.com/p/e7c5e2400935
#pragma mark - UIGestureRecognizerDelegate
//这个方法在视图控制器完成push的时候调用
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (navigationController.viewControllers.count == 1){
        //如果堆栈内的视图控制器数量为1 说明只有根控制器，将currentShowVC 清空，为了下面的方法禁用侧滑手势
        self.currentShowVC = Nil;
    }
    else{
        //将push进来的视图控制器赋值给currentShowVC
        self.currentShowVC = viewController;
    }
}
//这个方法是在手势将要激活前调用：返回YES允许侧滑手势的激活，返回NO不允许侧滑手势的激活
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    //首先在这确定是不是我们需要管理的侧滑返回手势
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        if (self.currentShowVC == self.topViewController) {
            //如果 currentShowVC 存在说明堆栈内的控制器数量大于 1 ，允许激活侧滑手势
            return YES;
        }
        //如果 currentShowVC 不存在，禁用侧滑手势。如果在根控制器中不禁用侧滑手势，而且不小心触发了侧滑手势，会导致存放控制器的堆栈混乱，直接的效果就是你发现你的应用假死了，点哪都没反应，感兴趣是神马效果的朋友可以自己试试 = =。
        return NO;
    }
    
    //这里就是非侧滑手势调用的方法啦，统一允许激活
    return YES;
}


#pragma mark - 返回item
- (UIBarButtonItem *)barButtonItem:(KYBarButtonType )type {
    
    return nil;
}


- (NSArray *)barButtonItems:(NSArray *)types andBarButtonBlock:(KYBarButtonBlock)block {
    self.barButtonBlock = block;
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSNumber *number in types) {
        switch (number.intValue) {
            case KYBarButtonType_Clear:{
                [array addObject:[self clearItem]];
                break;
            }
            case KYBarButtonType_Save:{
                [array addObject:[self saveItem]];
                break;
            }
            case KYBarButtonType_Call:{
//                [array addObject:[self itemSpacer]];
                [array addObject:[self callItem]];
                break;
            }
            case KYBarButtonType_User:{
//                [array addObject:[self itemSpacer]];
                [array addObject:[self messageItem]];
                break;
            }
            default:
                break;
        }
        
    }
    return array;
}


#pragma mark - private

- (UIBarButtonItem *)backItem {
    //定制了一个返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 65, 40);
    [backBtn setImage:[UIImage imageNamed:@"back_nor"] forState:UIControlStateNormal];
    //    [backBtn setImage:[UIImage imageNamed:@"back_nor"] forState:UIControlStateSelected];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 6, 0, 0)];//稍微调整下文字图片间距
    //    backBtn.imageView.backgroundColor = [UIColor redColor];
    
    [backBtn addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    //    [backBtn setBackgroundColor:[UIColor greenColor]];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -15;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    leftItem.tag = KYBarButtonType_Back;
    return leftItem;
    
//    self.navigationItem.leftBarButtonItems = [[NSArray alloc] initWithObjects:negativeSpacer, leftItem, nil];
    
}
- (UIBarButtonItem *)clearItem {
    UIBarButtonItem *cleanButton = [[UIBarButtonItem alloc] initWithTitle:@"清空"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(itemAction:)];
    cleanButton.tag = KYBarButtonType_Clear;
    
    return cleanButton;
}

- (UIBarButtonItem *)saveItem {
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"保存"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(itemAction:)];
    saveButton.tag = KYBarButtonType_Save;
    
    return saveButton;
}

//如果是图片默认加上间距，以缩小间距
- (UIBarButtonItem *)messageItem {
    
    UIBarButtonItem *messageButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header_icon_single"]
                                                        landscapeImagePhone:[UIImage imageNamed:@"header_icon_single_pressed"]
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(itemAction:)];
    
    messageButton.tag = KYBarButtonType_User;
    
    return messageButton;
}

- (UIBarButtonItem *)callItem {
    
    UIBarButtonItem *callButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"aio_head_twocall"]
                                                        landscapeImagePhone:[UIImage imageNamed:@"aio_head_twocall_pressed"]
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(itemAction:)];
    callButton.tag = KYBarButtonType_Call;
    return callButton;
}

#pragma mark - 间距
- (UIBarButtonItem *)itemSpacer {
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -15;
    return negativeSpacer;
}
#pragma mark - itemAction

- (void)itemAction:(UIBarButtonItem *)item {
    self.barButtonBlock(item);
    NSLog(@"item tag = %zd",item.tag);
}

@end
