//
//  HomeTableViewCell.m
//  SoulFM
//
//  Created by lijinghua on 15/12/17.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeCategoryCollectionViewCell.h"

NSString *const kCollectionCellId = @"collectionCellId";

@implementation HomeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.collectionView];
        [self customCollectionView];
    }
    return self;
}

- (void)customCollectionView{
    //子类定制
}

- (UICollectionView*)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.bounces = NO;
        
        _collectionView.dataSource = self;
        _collectionView.delegate   = self;
        
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        
        //注册使用的cell
        UINib *nib = [UINib nibWithNibName:@"HomeCategoryCollectionViewCell" bundle:nil];
        [_collectionView registerNib:nib forCellWithReuseIdentifier:kCollectionCellId];
        [_collectionView registerNib:nib forCellWithReuseIdentifier:kCollectionCellId];
    }
    return _collectionView;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


- (void)updateWithModelArray:(NSArray*)array{
    self.dataSourceArray = array;
    [self.collectionView reloadData];
}

#pragma mark -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSourceArray.count;
}

//子类定制
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

//选中其中一个
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    JSONModel *jsonModel = [self.dataSourceArray objectAtIndex:indexPath.row];
    [self didSelectModel:jsonModel];
}

- (void)didSelectModel:(JSONModel*)model{
    //子类定制
}

@end
