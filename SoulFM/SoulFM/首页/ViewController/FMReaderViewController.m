//
//  FMReaderViewController.m
//  SoulFM
//
//  Created by lijinghua on 15/12/19.
//  Copyright © 2015年 lijinghua. All rights reserved.
//
//Reader主播
#import "FMReaderViewController.h"
#import "ReaderHeadView.h"
#import "FMConfigration.h"
#import "ReaderInfoModel.h"
#import "ReaderContentListModel.h"
#import "HomeSectionHeaderView.h"
#import "ReaderListItemTableViewCell.h"
#import "FMContentViewController.h"
#import "HotFMModel.h"

@interface FMReaderViewController ()<UITableViewDelegate,UITableViewDataSource,FMNetEngineDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic)ReaderHeadView  *readerHeaderView;
@property (nonatomic)HomeSectionHeaderView  *sectionHeadView;
@property (nonatomic)NSInteger pageNo;

@property (nonatomic)NSMutableArray  *readerContentList;
@property (nonatomic)ReaderInfoModel *readerInfoModel;
@property (nonatomic)NSMutableArray *modelArray;
@end

@implementation FMReaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.estimatedRowHeight = 70;
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = self.readerHeaderView;
    [self registTableViewCell];
    [self fetchReaderInformation];
    [self fetchReaderContentItemListAtPage:self.pageNo];
}

- (void)registTableViewCell{
    UINib *nib = [UINib nibWithNibName:@"ReaderListItemTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cellId"];
}

#pragma mark - custom View

- (ReaderHeadView*)readerHeaderView{
    if (_readerHeaderView == nil) {
        UINib *nib = [UINib nibWithNibName:@"ReaderHeadView" bundle:nil];
        _readerHeaderView = (ReaderHeadView*)[[nib instantiateWithOwner:nil options:nil] firstObject];
    }
   
    return _readerHeaderView;
}

- (HomeSectionHeaderView*)sectionHeadView{
    if (_sectionHeadView == nil) {
        UINib *nib = [UINib nibWithNibName:@"HomeSectionHeaderView" bundle:nil];
        _sectionHeadView = [[nib instantiateWithOwner:nil options:nil] firstObject];
        [_sectionHeadView setColor:[UIColor redColor] title:nil];
    }
    return _sectionHeadView;
}

#pragma mark - fetch network
- (void)fetchReaderInformation{
    FMNetEngine *engine = [[FMConfigration sharedInstance] configrationOfKey:kFMReaderInfoConfigKey];
    engine.delegate = self;
    [engine setRequestTag:1000];
    [engine setRequestValue:@"GET" forKey:kRequestMethodKey];
    [engine setRequestValue:self.model.id forKey:@"modelId"];
    [engine fetchNetworkData];
}

- (void)fetchReaderContentItemListAtPage:(NSInteger)pageNo{
    FMNetEngine *engine = [[FMConfigration sharedInstance] configrationOfKey:kFMReaderListConfigKey];
    engine.delegate = self;
    [engine setRequestTag:1001];
    [engine setRequestValue:@"GET" forKey:kRequestMethodKey];
    [engine setRequestValue:self.model.id forKey:@"modelId"];
    [engine setRequestValue:[NSString stringWithFormat:@"%ld",self.pageNo] forKey:@"pageNo"];
    [engine fetchNetworkData];
}


- (void)netEngine:(FMNetEngine*)engine dataSource:(id)dataSource;
{
    if ([engine requtestTag] == 1000) {
        //返回的是主播的信息列表
        self.readerInfoModel = dataSource;
        [self.readerHeaderView updateUIWith:dataSource];
        [self.sectionHeadView setColor:[UIColor redColor] title:[NSString stringWithFormat:@"全部节目 (%@)",self.readerInfoModel.fmnum]];
        
    }else if([engine requtestTag] == 1001){
        //返回的是主播的主播列表
        self.readerContentList = dataSource;
        [self.tableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray*)modelArray{
    _modelArray = [NSMutableArray array];
    for (ReaderContentListModel *model in self.readerContentList) {
        HotFMModel *hotFMModel = [HotFMModel covertFromReadItemModel:model];
        [_modelArray addObject:hotFMModel];
    }
    return _modelArray;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.sectionHeadView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.readerContentList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReaderListItemTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    ReaderContentListModel *model = [self.readerContentList objectAtIndex:indexPath.row];
    [cell updateUIWith:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FMContentViewController *contentViewController = [FMContentViewController sharedInstance];
    contentViewController.hidesBottomBarWhenPushed = YES;
    contentViewController.modelArray   = self.modelArray;
    contentViewController.currentIndex = indexPath.row;
    [self.navigationController pushViewController:contentViewController animated:YES];
}

@end
