//
//  HomeCategoryCollectionViewCell.m
//  SoulFM
//
//  Created by lijinghua on 15/12/17.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HomeCategoryCollectionViewCell.h"

@implementation HomeCategoryCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)updateWithImageName:(NSString *)imageName title:(NSString*)title
{
    NSLog(@"%@",NSStringFromCGRect(self.frame));
    [self updateConstraintsIfNeeded];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:nil];
    self.titleLabel.text = title;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.showCirlce) {
        CGRect rect = self.iconImageView.frame;
        rect.size.height = rect.size.width;
        self.iconImageView.frame = rect;
        self.iconImageView.layer.cornerRadius = self.iconImageView.bounds.size.width/2;
        self.iconImageView.layer.masksToBounds = YES;
    }
}
@end
