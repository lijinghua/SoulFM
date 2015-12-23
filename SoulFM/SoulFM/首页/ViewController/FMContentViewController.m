//
//  FMContentViewController.m
//  SoulFM
//
//  Created by lijinghua on 15/12/19.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMContentViewController.h"
#import "FMContentHeaderView.h"
#import "FMContentModel.h"
#import "FMPlayer.h"
#import "SpeakerTableViewCell.h"
#import "UserGiftTableViewCell.h"

@interface FMContentViewController ()<FMConentHeadViewDelegate>
@property(nonatomic)FMContentHeaderView *headerView;
@property(nonatomic)NSString *currentModelId;
@property(nonatomic)FMContentModel *contentModel;
@property(nonatomic)BOOL registKVO;
@end

@implementation FMContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)customUI{
    [self.view addSubview:self.tableView];
    [self customTableViewCell];
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    self.tableView.backgroundColor = [UIColor clearColor];

    //配置头部
    self.tableView.tableHeaderView = self.headerView;
}

- (void)customTableViewCell
{
    UINib *nib = [UINib nibWithNibName:@"SpeakerTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"firstCellId"];
    UINib *nib2 = [UINib nibWithNibName:@"UserGiftTableViewCell" bundle:nil];
    [self.tableView registerNib:nib2 forCellReuseIdentifier:@"secondCellId"];
}

- (FMContentHeaderView*)headerView{
    if (_headerView == nil) {
        UINib *nib = [UINib nibWithNibName:@"FMContentHeaderView" bundle:nil];
        _headerView =  (FMContentHeaderView*)[[nib instantiateWithOwner:nil options:nil] firstObject];
        _headerView.delegate = self;
    }
   
    return _headerView;
}

- (void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    HotFMModel *model = [self.modelArray objectAtIndex:self.currentIndex];
    self.currentModelId = model.id;
}

#pragma mark - NetWork
//重写网络请求
- (void)fetchMessage
{
    FMNetEngine *engine = [[FMConfigration sharedInstance] configrationOfKey:kFMContentConfigKey];
    engine.delegate = self;
    [engine setRequestValue:@"GET" forKey:kRequestMethodKey];
    [engine setRequestValue:self.currentModelId forKey:@"modelId"];
    [engine fetchNetworkData];
}


- (void)netEngine:(FMNetEngine *)engine dataSource:(id)dataSource{
    self.contentModel = (FMContentModel*)dataSource;
    //得到数据后刷新界面
    [self.headerView updateContent:self.contentModel];
    [self.tableView reloadData];
    
    //播放音乐
    [[FMPlayer sharedInstance] playerFMAtUrl:self.contentModel.url];
    [[FMPlayer sharedInstance] addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew context:nil];
    [[FMPlayer sharedInstance] addObserver:self forKeyPath:@"duration" options:NSKeyValueObservingOptionNew context:nil];
    self.registKVO = YES;
}

- (void)dealloc{
    if (self.registKVO) {
        [[FMPlayer sharedInstance] removeObserver:self forKeyPath:@"progress"];
        [[FMPlayer sharedInstance] removeObserver:self forKeyPath:@"duration"];
    }
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"progress"]) {
        CGFloat progress = [[change objectForKey:NSKeyValueChangeNewKey] floatValue];
        [self.headerView updateProgress:progress];
    }
}

#pragma mark - PlayDelegate
- (void)playNextFMContent:(FMContentHeaderView *)sender
{
    self.currentIndex++;
    if (self.currentIndex >= 0 && self.currentIndex < self.modelArray.count) {
        [self fetchMessage];
    }
}

- (void)playCurrentFMContent:(FMContentHeaderView *)sender{
    if (self.currentIndex >= 0 && self.currentIndex < self.modelArray.count) {
        [[FMPlayer sharedInstance] resume];
    }
}

- (void)pauseCurrentFMContent:(FMContentHeaderView *)sender
{
    [[FMPlayer sharedInstance] pause];
}

- (void)playPrevFMContent:(FMContentHeaderView *)sender
{
    self.currentIndex--;
    if (self.currentIndex >= 0 && self.currentIndex < self.modelArray.count) {
        [self fetchMessage];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (self.contentModel.userGiftList.count > 0) {
        return 2;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 80;
    }
    return 100;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return [self customFirstCellAtIndexPath:indexPath];
    }else if(indexPath.row == 1){
        return [self customSecondCellAtIndexPath:indexPath];
    }
    return nil;
}

- (UITableViewCell*)customFirstCellAtIndexPath:(NSIndexPath*)indexPath
{
    SpeakerTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"firstCellId" forIndexPath:indexPath];
    [cell updateWithModel:self.contentModel.speaker];
    return cell;
}

- (UITableViewCell*)customSecondCellAtIndexPath:(NSIndexPath*)indexPath
{
    UserGiftTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"secondCellId" forIndexPath:indexPath];
    [cell updateWithUserGiftArray:self.contentModel.userGiftList];
    
    return cell;
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
