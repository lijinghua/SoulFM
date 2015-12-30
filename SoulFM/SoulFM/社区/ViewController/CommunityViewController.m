//
//  CommunityViewController.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "CommunityViewController.h"
#import "CommunityTableViewCell.h"
#import "CommunityModel.h"

@interface CommunityViewController ()
@property(nonatomic)UISegmentedControl *segmentCtrl;
@property(nonatomic)NSInteger page;
@property(nonatomic)NSArray   *dataSource;
@end

@implementation CommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //[self createHeadView];
}

- (void)customUI{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    UINib *nib = [UINib nibWithNibName:@"CommunityTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cellId"];
    
    [self.view addSubview:self.tableView];
}


- (void)customInitData
{
    self.page = 0;
}

- (void)customTitleView{
    self.segmentCtrl = [[UISegmentedControl alloc]initWithItems:@[@"精华",@"最新"]];
    [self.segmentCtrl addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    self.segmentCtrl.tintColor = [UIColor orangeColor];
    [self.segmentCtrl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [self.segmentCtrl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateNormal];
    self.segmentCtrl.selectedSegmentIndex = 0;
    self.segmentCtrl.frame = CGRectMake(0, 0, 120, 24);
    self.navigationItem.titleView = self.segmentCtrl;
}

#pragma mark - NetWork
- (void)fetchMessage
{
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleDrop];
    [MMProgressHUD showWithTitle:@"加载中...."];
    FMNetEngine *netEngine = [[FMConfigration sharedInstance] configrationOfKey:kFMCommunitiyConfigKey];
    netEngine.delegate = self;
    if (self.segmentCtrl.selectedSegmentIndex == 0) {
        [netEngine setRequestValue:[self essenceUrl] forKey:kRequestUrlKey];
    }else{
        [netEngine setRequestValue:[self hottestUrl] forKey:kRequestUrlKey];
    }
    [netEngine fetchNetworkData];
    
}

- (NSString*)essenceUrl{
    return [NSString stringWithFormat:FMCommunityUrl,1];
}

- (NSString*)hottestUrl{
    return [NSString stringWithFormat:FMCommunityUrl,0];
}

- (void)netEngine:(FMNetEngine *)engine dataSource:(id)dataSource{
    self.dataSource = dataSource;
    [self.tableView reloadData];
    [MMProgressHUD dismissWithSuccess:@"加载完毕"];
}

#pragma mark - SegmentAction

- (void)segmentClick:(UISegmentedControl*)segment
{
    [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:NO];
    [self fetchMessage ];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    CommunityModel *model = [self.dataSource objectAtIndex:indexPath.row];
    [cell updateWithModel:model];
    return cell;
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
