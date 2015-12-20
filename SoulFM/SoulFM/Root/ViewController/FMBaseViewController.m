//
//  FMBaseViewController.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMBaseViewController.h"

@interface FMBaseViewController ()

@end

@implementation FMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customInitData];
    [self customUI];
    [self customNavigationBar];
    [self fetchMessage];
}

#pragma mark - Custom
- (void)customInitData{
    
}

- (void)customUI{
    [self.view addSubview:self.tableView];
    [self customTableViewCell];
}

- (void)customNavigationBar{
    
}

- (void)customTableViewCell{
}

- (UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-49) style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate   = self;
    }
    return _tableView;
}

#pragma mark - Network
- (void)fetchMessage{
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleDrop];
    [MMProgressHUD showWithTitle:@"全力加载中"];
    
    FMNetEngine * netEngine = [[FMConfigration sharedInstance] configrationOfKey:[self fetchEngineConfigrationKey]];
    netEngine.delegate = self;
    [netEngine fetchNetworkData];
    [MMProgressHUD dismissWithSuccess:@"加载结束"];
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

@end
