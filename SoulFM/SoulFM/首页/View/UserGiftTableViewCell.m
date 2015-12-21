//
//  UserGiftTableViewCell.m
//  SoulFM
//
//  Created by lijinghua on 15/12/21.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "UserGiftTableViewCell.h"
#import "HomeCategoryCollectionViewCell.h"
#import "UserGiftModel.h"

@interface UserGiftTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,weak)NSArray *modelArray;
@end

@implementation UserGiftTableViewCell

- (void)awakeFromNib {

    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    flowLayout.itemSize = CGSizeMake(68, 68);
    self.collectionView.backgroundColor = [UIColor clearColor];
    //注册使用的单元格
    UINib *nib = [UINib nibWithNibName:@"HomeCategoryCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"cellId"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)updateWithUserGiftArray:(NSArray *)array{
    self.modelArray = array;
    [self.collectionView reloadData];
}

#pragma mark - UICollectionView代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.modelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCategoryCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.iconImageView.layer.cornerRadius = 22;
    cell.iconImageView.layer.masksToBounds = YES;
    cell.titleLabel.font = [UIFont systemFontOfSize:11];
    UserGiftModel *model = [self.modelArray objectAtIndex:indexPath.item];
    [cell updateWithImageName:model.avatar title:model.nickname];
    return cell;
}

@end
