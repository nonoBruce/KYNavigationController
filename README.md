NavigationController
##NavigationController
NavigationController不同层级的页面跳转


##UITabBarController
UITabBarController设置在平级之间的跳转
####更改背景颜色
```
UIView *tabBgView = [[UIView alloc] initWithFrame:_mainTabBarController.tabBar.bounds];
tabBgView.backgroundColor = [UIColor blackColor];
[_mainTabBarController.tabBar insertSubview:tabBgView atIndex:0];

```




##UITabBarItem
####设置图片和文字
```
UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:title image:[UIImage imageNamed:image] selectedImage:[UIImage imageNamed:selectedImage]];

```

####更改文字的大小和样式

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

####设置只有图片没有文字
一般情况直接去掉文字会拉伸图片，变长，设置item.imageInsets 这个值的top和bottom相同会防止拉伸。

```
// TabBar图片位置，使之垂直居中显示 
CGFloat offset = 6.0; 
for (UITabBarItem *item in self.tabbar.items) { 
	item.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0); 
}

```


