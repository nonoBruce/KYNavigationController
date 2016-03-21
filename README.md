NavigationController
##NavigationController
NavigationController不同层级的页面跳转

##UIBarButtonItem
####1.右边添加一个ButtonItem

```   
//右边按钮
UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"右边按钮"
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(rightItem)];
self.navigationItem.rightBarButtonItem = rightItem;

```
####2.右边添加多个ButtonItem

```
//文字的
UIBarButtonItem *cleanButton = [[UIBarButtonItem alloc] initWithTitle:@"清空"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(cleanTextView)];
UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"保存"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(saveTextView)];
                                                        
NSArray *buttonArray = [[NSArray alloc]initWithObjects:cleanButton,saveButton, nil];
self.navigationItem.rightBarButtonItems = buttonArray;


//图片的
UIBarButtonItem *cleanButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header_icon_single"]
                                                  landscapeImagePhone:[UIImage imageNamed:@"header_icon_single_pressed"]
                                                                style:UIBarButtonItemStylePlain
                                                               target:self action:@selector(cleanTextView:)];
                                
UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"aio_head_twocall"]
                                                 landscapeImagePhone:[UIImage imageNamed:@"aio_head_twocall_pressed"]
                                                               style:UIBarButtonItemStylePlain
                                                              target:self action:@selector(saveTextView:)];

NSArray *buttonArray = [[NSArray alloc]initWithObjects:cleanButton,saveButton, nil];
self.navigationItem.rightBarButtonItems = buttonArray;


```

####3.自定义图标的

```
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

```

####4.调整UIBarButtonItem间距
可以创建一个类型为UIBarButtonSystemItemFixedSpace的UIBarButtonItem

```

UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                   target:nil action:nil];
negativeSpacer.width = -15;

self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects:negativeSpacer, rightItem,nil] ;

```

####5.修改返回的图标

```
//修改返回图标的图片，在这边修改可以直接保留手势返回
//注意图片要正方形，不然会偏移，不居中
- (void)setNavigationBack{
    
    UINavigationBar * navigationBar = [UINavigationBar appearance];
    //返回按钮的箭头颜色
//    [navigationBar setTintColor:[UIColor greenColor]];
    
    //设置返回样式图片
    UIImage *image = [UIImage imageNamed:@"back_nor"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

//    iOS7之后如果要定制返回图片，需要下面2个值都设置
//    Note: These properties must both be set if you want to customize the back indicator image.
    navigationBar.backIndicatorImage = image;
    navigationBar.backIndicatorTransitionMaskImage = image;
    
}
```

####6.自定义leftBarButtonItem，右滑手势消失问题
leftBarButtonItem自定义，默认右滑动返回会消失。
自定义方式和rightBarButtonItem的方式都是一样的


##UITabBarController
UITabBarController设置在平级之间的跳转
####1.更改背景颜色
```
UIView *tabBgView = [[UIView alloc] initWithFrame:_mainTabBarController.tabBar.bounds];
tabBgView.backgroundColor = [UIColor blackColor];
[_mainTabBarController.tabBar insertSubview:tabBgView atIndex:0];

```
####2.进入子视图的时候UITabBarController隐藏

```
HomeSubViewController *viewController = [[HomeSubViewController alloc] init];
viewController.hidesBottomBarWhenPushed = YES;//这个要放到push之前
[self.navigationController pushViewController:viewController animated:YES];

```



##UITabBarItem
####1.设置图片和文字
```
UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:title image:[UIImage imageNamed:image] selectedImage:[UIImage imageNamed:selectedImage]];

```
####2.设置选中的图片颜色不变蓝（iOS7之后）

如需使用自定义颜色的选中图时，需设置UIImageRenderingModeAlwaysOriginal。

```
selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

```

####3.更改文字的大小和样式

attributes	
A dictionary containing key-value pairs for text attributes.

You can specify the font, text color, text shadow color, and text shadow offset using the keys listed in NSString UIKit Additions Reference.
state	
The control state for which you want to set the text attributes for the title.

例子：

```
//---改变UITabBarItem的字体和颜色
NSDictionary *AttributeNormalDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor blackColor], NSForegroundColorAttributeName,
                                      [UIFont fontWithName:@"Helvetica" size:10.0f], NSFontAttributeName, nil];

[[UITabBarItem appearance] setTitleTextAttributes:AttributeNormalDic forState:UIControlStateNormal];
        
        
NSDictionary *AttributeSelectedDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor redColor], NSForegroundColorAttributeName,
                                      [UIFont fontWithName:@"Helvetica" size:10.0], NSFontAttributeName, nil];

[[UITabBarItem appearance] setTitleTextAttributes:AttributeSelectedDic forState:UIControlStateSelected];

```

####4.设置只有图片没有文字
一般情况直接去掉文字会拉伸图片，变长，设置item.imageInsets 这个值的top和bottom相同会防止拉伸。

```
// TabBar图片位置，使之垂直居中显示 
CGFloat offset = 6.0; 
for (UITabBarItem *item in self.tabbar.items) { 
	item.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0); 
}

```



