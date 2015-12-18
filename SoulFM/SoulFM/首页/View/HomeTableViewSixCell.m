//
//  HomeTableViewSixCell.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HomeTableViewSixCell.h"
#import "HomeCategoryCollectionViewCell.h"
#import "DianTaiModel.h"


@implementation HomeTableViewSixCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)customCollectionView{
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    flowLayout.minimumInteritemSpacing = 1;
    flowLayout.minimumLineSpacing = 1;
    CGFloat width = (kScreenWidth-40)/4;
    CGFloat height = width;
    flowLayout.itemSize = CGSizeMake(width, height);
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
}

#pragma mark - UICollectionView 代理

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeCategoryCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:kCollectionCellId forIndexPath:indexPath];
      DianTaiModel *model = [self.dataSourceArray objectAtIndex:indexPath.item];
    [cell setShowCirlce:YES];
    cell.titleLabel.font = [UIFont systemFontOfSize:11];
    [cell updateWithImageName:model.cover title:model.title];
    return cell;
}

@end
