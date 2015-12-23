//
//  DiscoverViewController.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverHeadView.h"
#import "DiscoverCollectionViewCellOne.h"
#import "DiscoverCollectionViewCellTwo.h"
#import "FMDiscoverHeadModel.h"
#import "DianTaiModel.h"
#import "FMDiscoverMoodTroubleModel.h"
#import "DiscoverCollectionSectionHeaView.h"

#define DISCOVER_HEADVIEW_HEIGH    306

#define kCollectionViewCellOne @"collectionViewCellOne"
#define kCollectionViewCellTwo @"collectionViewCellTwo"
#define kCollectionHeadView    @"collectionHeadViewId"

@interface DiscoverViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic)DiscoverHeadView *discoverHeadView;
@property(nonatomic)UICollectionView *collectionView;

//使用到的数据源
@property(nonatomic,copy)NSArray *moodArray;
@property(nonatomic,copy)NSArray *troubleArray;
@property(nonatomic,copy)NSArray *headDataArray;
@property(nonatomic,copy)NSArray *speakerDataArray;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)customInitData
{
    self.moodArray = [FMDiscoverMoodTroubleModel paringDataFromLocalmood];
    self.troubleArray = [FMDiscoverMoodTroubleModel paringDataFromLocaltrouble];
}

- (void)customUI
{
    [self.view addSubview:self.collectionView];
    [self.collectionView addSubview:self.discoverHeadView];
    [self registCollectionViewCell];
    [self registCollectionHeadView];
}


- (void)registCollectionViewCell{
    UINib *nib = [UINib nibWithNibName:@"DiscoverCollectionViewCellOne" bundle:nil];
    UINib *nib2 = [UINib nibWithNibName:@"DiscoverCollectionViewCellTwo" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:kCollectionViewCellOne];
    [self.collectionView registerNib:nib2 forCellWithReuseIdentifier:kCollectionViewCellTwo];
}

- (void)registCollectionHeadView{
    UINib *nib = [UINib nibWithNibName:@"DiscoverCollectionSectionHeaView" bundle:nil];
    [self.collectionView registerNib:nib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kCollectionHeadView];
}

- (UICollectionView*)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumInteritemSpacing = 1;
        flowLayout.minimumLineSpacing      = 1;

        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-49) collectionViewLayout:flowLayout];
        _collectionView.contentInset = UIEdgeInsetsMake(DISCOVER_HEADVIEW_HEIGH, 0, 0, 0);
        _collectionView.dataSource = self;
        _collectionView.delegate   = self;
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _collectionView;
}

- (DiscoverHeadView*)discoverHeadView{
    if (_discoverHeadView == nil) {
        UINib *nib = [UINib nibWithNibName:@"DiscoverHeadView" bundle:nil];
        _discoverHeadView = [[nib instantiateWithOwner:nil options:nil] firstObject];
        _discoverHeadView.frame = CGRectMake(0,-DISCOVER_HEADVIEW_HEIGH,kScreenWidth,DISCOVER_HEADVIEW_HEIGH);
    }
    return _discoverHeadView;
}

#pragma mark - NetWork

- (void)fetchMessage{
    [self fetchDiscoverHeadViewData];
    [self fetchDiscoverFootViewData];
}

- (void)fetchDiscoverHeadViewData{
    FMNetEngine *netEngine = [[FMConfigration sharedInstance] configrationOfKey:kFMDiscoverConfigKey];
    netEngine.delegate = self;
    [netEngine setRequestValue:FMDiscHeadView forKey:kRequestUrlKey];
    [netEngine fetchNetworkData];
}

- (void)fetchDiscoverFootViewData{
    FMNetEngine *netEngine = [[FMConfigration sharedInstance] configrationOfKey:kFMDiscoverConfigKey];
    netEngine.delegate = self;
    [netEngine setRequestValue:FMDiscFootView forKey:kRequestUrlKey];
    [netEngine fetchNetworkData];
}

- (void)netEngine:(FMNetEngine *)engine dataSource:(id)dataSource{
    if ([[dataSource firstObject] isKindOfClass:[FMDiscoverHeadModel class]]) {
        self.headDataArray = dataSource;
        [self.discoverHeadView updateHeadView:self.headDataArray];
    }else{
        self.speakerDataArray = dataSource;
    }
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return self.moodArray.count;
    }else if (section == 1){
        return self.troubleArray.count;
    }
    return self.speakerDataArray.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 || indexPath.section == 1) {
        DiscoverCollectionViewCellOne *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellOne forIndexPath:indexPath];
        if (indexPath.section == 0) {
            FMDiscoverMoodTroubleModel *model = [self.moodArray objectAtIndex:indexPath.row];
            [cell updateWithModel:model];
        }else{
            FMDiscoverMoodTroubleModel *model = [self.troubleArray objectAtIndex:indexPath.row];
            [cell updateWithModel:model];
        }
        return cell;
    }
    
    DiscoverCollectionViewCellTwo *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellTwo forIndexPath:indexPath];
    DianTaiModel *model =  [self.speakerDataArray objectAtIndex:indexPath.row];
    [cell updateWith:model];
    return cell;
}


- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    DiscoverCollectionSectionHeaView *headView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kCollectionHeadView forIndexPath:indexPath];
    if (indexPath.section == 0) {
        [headView setTitle:@"心情"];
        [headView showMoreInfo:NO];
    }else if (indexPath.section == 1){
        [headView setTitle:@"场景"];
        [headView showMoreInfo:NO];
    }else{
        [headView setTitle:@"主播"];
        [headView showMoreInfo:YES];
    }
    return headView;
}

#pragma mark - itemsize
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 || indexPath.section == 1) {
        return CGSizeMake((kScreenWidth)/3.0-1, (kScreenWidth)/3.0-1);
    }
    return CGSizeMake(156, 66);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(20, 30);
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
