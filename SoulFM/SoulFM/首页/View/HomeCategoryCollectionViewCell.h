//
//  HomeCategoryCollectionViewCell.h
//  SoulFM
//
//  Created by lijinghua on 15/12/17.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Catagory.h"

@interface HomeCategoryCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property(nonatomic)BOOL showCirlce;

- (void)updateWithImageName:(NSString *)imageName title:(NSString*)title;
@end
