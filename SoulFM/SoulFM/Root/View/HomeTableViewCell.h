//
//  HomeTableViewCell.h
//  SoulFM
//
//  Created by lijinghua on 15/12/17.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const kCollectionCellId;

@interface HomeTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic)UICollectionView *collectionView;
@property(nonatomic)NSArray *dataSourceArray;


- (void)updateWithModelArray:(NSArray*)array;

- (void)didSelectModel:(JSONModel*)model;

@end
