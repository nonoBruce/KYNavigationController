//
//  HomeViewController.m
//  KYNavigationController
//
//  Created by bruce on 16/3/18.
//  Copyright © 2016年 KY. All rights reserved.
//

#import "HomeViewController.h"
@interface HomeViewController ()

@property(nonatomic, strong)NSMutableArray *dataArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"消息";
    
//    self.view.backgroundColor = [UIColor blackColor];
    
    
    //设置titleView ，也可用其他的View
    //items can be NSStrings or UIImages. control is automatically sized to fit content
    UISegmentedControl *segement = [[UISegmentedControl alloc]initWithItems:@[@"消息   ",@"电话   "]];
//    segement.tintColor = [UIColor colorWithRed:0.831 green:0.941 blue:0.980 alpha:1];
    [segement addTarget:self action:@selector(seggementValueChanged:) forControlEvents:UIControlEventValueChanged];
    segement.selectedSegmentIndex = 0;
    self.navigationItem.titleView = segement;
   
    
    [self sourceData];
}

- (void)sourceData {
    self.dataArray = [[NSMutableArray alloc] initWithObjects:
                      @"左边按钮",
                      @"右边按钮",
                      @"右边按钮间距设置",
                      @"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    

}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}
//WSChatTableViewController *chat = [[WSChatTableViewController alloc]init];
//chat.hidesBottomBarWhenPushed = YES;
//[self.navigationController pushViewController:chat animated:YES];

- (IBAction)nextView:(id)sender {
//    HomeSubViewController *viewController = [[HomeSubViewController alloc] init];
//    viewController.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:viewController animated:YES];
    

    
}

#pragma mark - 
/**
 *  @brief  Segement 变化
 */
-(void)seggementValueChanged:(UISegmentedControl *)segmentedControl {
    switch (segmentedControl.selectedSegmentIndex) {
        case 0: {
            self.title = @"消息";
            break;
            
        }
        case 1: {
            self.title = @"电话";
            break;
        }
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - table delegate source

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
    static NSString *CellIdentifier = @"HomeTableViewCell";
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
    if(indexPath.row==0){
        
        viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftBarUIViewController"];
    }else {
        viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeSubViewController"];

    }
    
    if(viewController){
        viewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewController animated:YES];
    }
}






@end
