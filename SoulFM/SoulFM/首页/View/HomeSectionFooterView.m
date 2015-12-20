//
//  HomeSectionFooterView.m
//  SoulFM
//
//  Created by lijinghua on 15/12/17.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HomeSectionFooterView.h"

@implementation HomeSectionFooterView


- (void)setHomeFootTitle:(NSString*)title
{
    self.titleLabel.text = title;
    [self.titleLabel sizeToFit];
    [self setNeedsLayout];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    CGSize titleSize = self.titleLabel.frame.size;
    self.indicatorView.center = CGPointMake(self.titleLabel.center.x + titleSize.width/2+10, self.titleLabel.center.y);
}

@end
