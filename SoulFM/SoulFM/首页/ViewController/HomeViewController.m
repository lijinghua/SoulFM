//
//  HomeViewController.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeModel.h"
#import "HotFMModel.h"
#import "HomeTableViewFirstCell.h"
#import "HomeTableViewSecondCell.h"
#import "HomeTableViewThirdCell.h"
#import "HomeTableViewFoutFiveCell.h"
#import "HomeTableViewSixCell.h"
#import "HomeSectionHeaderView.h"
#import "HomeSectionFooterView.h"
#import "FMItemListTableViewController.h"
#import "MoreSpeakerViewController.h"

static NSString * const kTableViewFirstCellId    = @"firstCellId";
static NSString * const kTableViewSecondCellId   = @"secondCellId";
static NSString * const kTableViewThirdCellId    = @"thirdCellId";
static NSString * const kTableViewFourFiveCellId = @"fourFiveCellId";
static NSString * const kTableViewSixCellId      = @"sixCellId";

NSString * const kNewLessonModelKey       = @"newlesson";
NSString * const kNewFMModelKey           = @"newfm";
NSString * const kHotFMModelKey           = @"hotmf";
NSString * const kCategoryModelKey        = @"category";
NSString * const kTuiJianModelKey         = @"tuijian";
NSString * const kDianTaiModelKey         = @"diantai";


@interface HomeViewController ()
@property(nonatomic)HomeModel *homeModel;
@property(nonatomic)NSArray   *modelKeyArray;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = YES;
}

#pragma mark - 配置

- (void)customInitData{
    self.modelKeyArray = @[kTuiJianModelKey,
                           kCategoryModelKey,
                           kHotFMModelKey,
                           kNewFMModelKey,
                           kNewFMModelKey,
                           kDianTaiModelKey];
}

- (NSString*)fetchEngineConfigrationKey
{
    return kHomeDataEngine;
}

- (void)customTableViewCell
{
    [self registClass:[HomeTableViewFirstCell class]  forCellId:kTableViewFirstCellId];
    [self registClass:[HomeTableViewSecondCell class] forCellId:kTableViewSecondCellId];
    [self registClass:[HomeTableViewThirdCell class]  forCellId:kTableViewThirdCellId];
    [self registClass:[HomeTableViewSixCell class]    forCellId:kTableViewSixCellId];
    [self registNib:@"HomeTableViewFoutFiveCell"      forCellId:kTableViewFourFiveCellId];
 }

- (void)registClass:(Class)className forCellId:(NSString*)cellId
{
    [self.tableView registerClass:className forCellReuseIdentifier:cellId];
}

- (void)registNib:(NSString*)nibName forCellId:(NSString*)cellId
{
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:cellId];
}

- (NSString*)cellIndentifyAtIndex:(NSInteger)section
{
    if (section == 0) return kTableViewFirstCellId;
    if (section == 1) return kTableViewSecondCellId;
    if (section == 2) return kTableViewThirdCellId;
    if (section == 3) return kTableViewFourFiveCellId;
    if (section == 4) return kTableViewFourFiveCellId;
    if (section == 5) return kTableViewSixCellId;
    return nil;
}

- (UIColor*)headHintColorOfSecton:(NSInteger)section{
    if (section == 2) return [UIColor purpleColor];
    if (section == 3) return [UIColor greenColor];
    if (section == 4) return [UIColor orangeColor];
    if (section == 5) return [UIColor blackColor];
    return nil;
}

- (NSString*)headTitleOfSection:(NSInteger)section{
    if (section == 2) return @" 热门推荐";
    if (section == 3) return @" 最新心理课";
    if (section == 4) return @" 最新FM";
    if (section == 5) return @" 心理电台推荐";
    return nil;
}

- (NSString*)footTitleOfSection:(NSInteger)section{
    if (section == 2) return @" 热门推荐";
    if (section == 3) return @" 最新心理课";
    if (section == 4) return @" 最新FM";
    if (section == 5) return @" 心理电台推荐";
    return nil;
}


#pragma mark - UITableView代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.modelKeyArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 3 || section == 4) {
        NSString *modelKey = [self.modelKeyArray objectAtIndex:section];
        NSArray *array = [self.homeModel allModelForKey:modelKey];
        return [array count];
    }
    
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [self customFirstCellAtIndexPath:indexPath];
    }else if (indexPath.section == 3 || indexPath.section == 4) {
        return [self customFourFiveCellAtIndexPath:indexPath];
    }else {
        return [self customHomeTableCellAtIndexPath:indexPath];
    }
    return nil;
}

- (UITableViewCell*)customFirstCellAtIndexPath:(NSIndexPath*)indexPath{
    NSString *cellIdentify = [self cellIndentifyAtIndex:indexPath.section];
    HomeTableViewFirstCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    NSArray* tuijianModelArray = [self.homeModel allModelForKey:kTuiJianModelKey];
   [cell upateWithModelArray:tuijianModelArray];
    return cell;
}

- (UITableViewCell*)customHomeTableCellAtIndexPath:(NSIndexPath*)indexPath{
    NSString *cellIdentify = [self cellIndentifyAtIndex:indexPath.section];
    HomeTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentify];
    NSArray *array = [self.homeModel allModelForKey:[self.modelKeyArray objectAtIndex:indexPath.section]];
    [cell updateWithModelArray:array];
    return cell;
}

- (UITableViewCell*)customFourFiveCellAtIndexPath:(NSIndexPath*)indexPath{
    
    NSString *cellIdentify = [self cellIndentifyAtIndex:indexPath.section];
    HomeTableViewFoutFiveCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentify];
    NSArray *array = [self.homeModel allModelForKey:[self.modelKeyArray objectAtIndex:indexPath.section]];
    //HotFMModel *model = [array objectAtIndex:indexPath.row];
    [cell updateWithModelAtIndex:indexPath.row ofArray:array];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 160;
    }else if (indexPath.section == 1) {
        return 160;
    }else if (indexPath.section == 2) {
        return 150;
    }else if (indexPath.section == 3 || indexPath.section == 4) {
        return 54;
    }else if (indexPath.section == 5) {
        return 120;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 0.01;
    }
    return 35;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0 || section == 1 || section == 2) {
        return 0.01;
    }
    return 30;
}


- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section < 2) {
        return nil;
    }
    UINib *nib = [UINib nibWithNibName:@"HomeSectionHeaderView" bundle:nil];
    HomeSectionHeaderView *headView = (HomeSectionHeaderView*)[[nib instantiateWithOwner:nil options:nil] firstObject];
    [headView setColor:[self headHintColorOfSecton:section] title:[self headTitleOfSection:section]];
    return headView;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section < 3) {
        return nil;
    }
    UINib *nib = [UINib nibWithNibName:@"HomeSectionFooterView" bundle:nil];
    HomeSectionFooterView *footView = (HomeSectionFooterView*)[[nib instantiateWithOwner:nil options:nil] firstObject];
    [footView setHomeFootTitle:[self footTitleOfSection:section]];
    footView.tag = section;
    [self addTapGestureOnFootView:footView];
    return footView;
    
}

#pragma mark - FMNetEngineDelegate
- (void)netEngine:(FMNetEngine *)engine dataSource:(id)dataSource
{
    self.homeModel = (HomeModel*)dataSource;
    [self.tableView reloadData];
}


- (void)addTapGestureOnFootView:(UIView*)footView{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    [footView addGestureRecognizer:tapGestureRecognizer];
}

- (void)handleTapGesture:(UITapGestureRecognizer*)gestrue
{
    UIView *targetView = gestrue.view;
    FMCategoryType type = [self categoryOfSection:targetView.tag];
    if (type == MORE_DIANTAI) {
        MoreSpeakerViewController *viewController = [[MoreSpeakerViewController alloc]init];
        viewController.type = MORE_DIANTAI;
        [self.navigationController pushViewController:viewController animated:YES];
        return;
    }
    FMItemListTableViewController *itemListViewController = [[FMItemListTableViewController alloc]initWithCategory:type];
    [self.navigationController pushViewController:itemListViewController animated:YES];
}

- (FMCategoryType)categoryOfSection:(NSInteger)section
{
    if (section == 3) return MORE_PSYCHOLOGY;
    if (section == 4) return MORE_FM;
    if (section == 5) return MORE_DIANTAI;
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
