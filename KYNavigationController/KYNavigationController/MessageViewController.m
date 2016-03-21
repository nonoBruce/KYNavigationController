//
//  MessageViewController.m
//  KYNavigationController
//
//  Created by bruce on 16/3/18.
//  Copyright © 2016年 KY. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@property(nonatomic, strong)NSMutableArray *dataArray;


@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Message";

    self.dataArray = [[NSMutableArray alloc] initWithObjects:
                      @"自定义leftBarButtonItems",
                      @"右边按钮",
                      @"右边按钮间距设置",
                      @"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
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


#pragma mark - table
- (void)setExtraCellLineHidden: (UITableView *)tableView{
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}
//default 1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //使用storyboard的Identifier标识指定Cell
    static NSString *CellIdentifier = @"MessageViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    //设置箭头,这个可以设置多个值
    //UITableViewCellAccessoryCheckmark  打钩
    //UITableViewCellAccessoryDetailButton  i的标志
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath.row = %zd",indexPath.row);
    UIViewController *viewController = nil;
//    if(indexPath.row==0){
//        
//        viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MessageSubViewController"];
//    }else {
        viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MessageSubViewController"];
        
//    }
    
    if(viewController){
        viewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewController animated:YES];
    }
}


@end
