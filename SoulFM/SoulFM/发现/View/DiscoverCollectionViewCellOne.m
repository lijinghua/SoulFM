//
//  DiscoverCollectionViewCellOne.m
//  SoulFM
//
//  Created by lijinghua on 15/12/23.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "DiscoverCollectionViewCellOne.h"

@interface DiscoverCollectionViewCellOne()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation DiscoverCollectionViewCellOne

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
}

- (void)updateWithModel:(FMDiscoverMoodTroubleModel*)model
{
    self.iconImageView.image = [UIImage imageNamed:model.iconImageView];
    self.titleLabel.text = model.name;
}

@end
