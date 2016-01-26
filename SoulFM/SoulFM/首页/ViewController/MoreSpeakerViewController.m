//
//  MoreSpeakerViewController.m
//  SoulFM
//
//  Created by lijinghua on 16/1/25.
//  Copyright © 2016年 lijinghua. All rights reserved.
//

#import "MoreSpeakerViewController.h"
#import "MoreDianTaiModel.h"

@interface MoreSpeakerViewController ()

@property(nonatomic)MoreDianTaiModel *model;

@end

@implementation MoreSpeakerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发现主播";
    self.navigationController.navigationBar.translucent = NO;
}


- (void)fetchMessage{
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleDrop];
    [MMProgressHUD showWithTitle:@"全力加载中"];
    
    FMNetEngine *netEngine = [[FMConfigration sharedInstance] configrationOfKey:kFMItemListDataEngine];
    netEngine.delegate = self;
    [netEngine setRequestValue:@(self.type)    forKey:@"categoryType"];
    [netEngine setRequestValue:@(0)            forKey:@"pageNo"];
    [netEngine fetchNetworkData];

    [MMProgressHUD dismissWithSuccess:@"加载结束"];
}

- (void)netEngine:(FMNetEngine *)engine dataSource:(id)dataSource{
    self.model = dataSource;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
