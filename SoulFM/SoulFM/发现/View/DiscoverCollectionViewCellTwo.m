//
//  DiscoverCollectionViewCellTwo.m
//  SoulFM
//
//  Created by lijinghua on 15/12/23.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "DiscoverCollectionViewCellTwo.h"

@interface DiscoverCollectionViewCellTwo ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end

@implementation DiscoverCollectionViewCellTwo

- (void)awakeFromNib {
    // Initialization code
    self.iconImageView.layer.cornerRadius = 24;
    self.iconImageView.layer.masksToBounds = YES;
}


- (void)updateWith:(DianTaiModel*)model
{
    [self.iconImageView  sd_setImageWithURL:[NSURL URLWithString:model.cover] completed:nil];
    self.nameLabel.text = model.title;
    self.categoryLabel.text = [NSString stringWithFormat:@"节目 %@",model.fmnum];
}

@end
