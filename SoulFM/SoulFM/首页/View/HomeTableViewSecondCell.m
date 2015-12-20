//
//  HomeTableViewSecondCell.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HomeTableViewSecondCell.h"
#import "HomeCategoryCollectionViewCell.h"
#import "Catagory.h"
#import "FMItemListTableViewController.h"

@implementation HomeTableViewSecondCell

- (void)customCollectionView{
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    CGFloat width  = (kScreenWidth - 80)/5;
    CGFloat height = width;
    layout.itemSize = CGSizeMake(width,height);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - UICollectionView 代理

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeCategoryCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:kCollectionCellId forIndexPath:indexPath];
    
    Catagory *categoryModel = [self.dataSourceArray objectAtIndex:indexPath.item];
    [cell.titleLabel setFont:[UIFont systemFontOfSize:11]];
    [cell updateWithImageName:categoryModel.cover title:categoryModel.name];
    return cell;
}


- (void)didSelectModel:(JSONModel *)model
{
    FMItemListTableViewController *itemListViewController = [[FMItemListTableViewController alloc]initWithCategory:COMMON];
    itemListViewController.model = (Catagory*)model;
    itemListViewController.hidesBottomBarWhenPushed = YES;
    UIViewController *respondViewController = [FMUtil firstResondViewController:self];
    [respondViewController.navigationController pushViewController:itemListViewController animated:YES];
}

@end
