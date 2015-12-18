//
//  HomeTableViewThirdCell.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HomeTableViewThirdCell.h"
#import "HomeCategoryCollectionViewCell.h"
#import "HotFMModel.h"

@implementation HomeTableViewThirdCell

- (void)customCollectionView{
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    CGFloat width = (kScreenWidth-45)/3;
    CGFloat height = 160-25;
    flowLayout.itemSize = CGSizeMake(width, height);
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
}

#pragma mark - UICollectionView 代理
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeCategoryCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:kCollectionCellId forIndexPath:indexPath];
    HotFMModel *model = [self.dataSourceArray objectAtIndex:indexPath.row];
    cell.titleLabel.font = [UIFont systemFontOfSize:11];
    [cell updateWithImageName:model.cover title:model.title];
    return cell;
}


@end
