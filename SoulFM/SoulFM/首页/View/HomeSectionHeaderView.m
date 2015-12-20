//
//  HomeSectionHeaderView.m
//  SoulFM
//
//  Created by lijinghua on 15/12/17.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HomeSectionHeaderView.h"



@implementation HomeSectionHeaderView

- (void)setColor:(UIColor*)color title:(NSString*)title
{
    self.colorView.backgroundColor = color;
    self.titleLabel.text = title;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
