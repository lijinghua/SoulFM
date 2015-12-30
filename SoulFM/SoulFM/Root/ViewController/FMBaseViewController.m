//
//  FMBaseViewController.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMBaseViewController.h"
#import "FMContentViewController.h"
#import "FMPlayer.h"

#define PLAY_IMG_TAG    9999

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

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self customPlayStatus];
}

- (void)customPlayStatus{
    if ([[FMPlayer sharedInstance] isPlaying]) {
        [self.playingIndicatorView startAnimating];
    }else{
        [self.playingIndicatorView stopAnimating];
    }
}

#pragma mark - Custom
- (void)customInitData{
    
}

- (void)customUI{
    [self.view addSubview:self.tableView];
    [self customTableViewCell];
}

- (void)customNavigationBar{
    [self customLeftNavigationBar];
    [self customTitleView];
    [self customRightNavigationBar];
}

- (void)customLeftNavigationBar{}
- (void)customTitleView{}
- (void)customRightNavigationBar{
    self.playingIndicatorView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    self.playingIndicatorView.image = [UIImage imageNamed:@"littlePlaying1.png"];
    self.playingIndicatorView.userInteractionEnabled = YES;
    self.playingIndicatorView.animationImages = self.playingImgArray;
    self.playingIndicatorView.animationRepeatCount = HUGE_VAL;
    [self customPlayStatus];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapOnGesture:)];
    [self.playingIndicatorView addGestureRecognizer:tap];

    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:self.playingIndicatorView];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)handleTapOnGesture:(UITapGestureRecognizer*)gesture
{
    FMContentViewController *contentViewController = [FMContentViewController sharedInstance];
    [self.navigationController pushViewController:contentViewController animated:YES];
}

- (NSArray*)playingImgArray{
    if (_playingImgArray == nil) {
        _playingImgArray = [NSMutableArray array];
        for (int index = 1; index <= 6; index++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"littlePlaying%d",index]];
            [_playingImgArray addObject:image];
        }
    }
    return _playingImgArray;
}

- (NSArray*)pausingImgArray{
    if (_pausingImgArray == nil) {
        _pausingImgArray = [NSMutableArray array];
        for (int index = 1; index <= 6; index++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"littlePaused%d",index]];
            [_pausingImgArray addObject:image];
        }
    }
    return _pausingImgArray;
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
