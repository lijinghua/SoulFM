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
    //self.navigationController.navigationBar.translucent = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
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
    HotFMModel *model = [array objectAtIndex:indexPath.row];
    [cell updateWithModel:model];
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
        return 0;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0 || section == 1 || section == 2) {
        return 0;
    }
    return 30;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UINib *nib = [UINib nibWithNibName:@"HomeSectionHeaderView" bundle:nil];
    HomeSectionHeaderView *headView = (HomeSectionHeaderView*)[[nib instantiateWithOwner:nil options:nil] firstObject];
    return headView;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UINib *nib = [UINib nibWithNibName:@"HomeSectionFooterView" bundle:nil];
    HomeSectionFooterView *footView = (HomeSectionFooterView*)[[nib instantiateWithOwner:nil options:nil] firstObject];
    return footView;
}

#pragma mark - FMNetEngineDelegate
- (void)netEngine:(FMNetEngine *)engine dataSource:(JSONModel *)model
{
    self.homeModel = (HomeModel*)model;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
