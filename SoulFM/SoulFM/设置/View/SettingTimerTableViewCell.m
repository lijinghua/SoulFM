//
//  SettingTimerTableViewCell.m
//  SoulFM
//
//  Created by lijinghua on 15/12/24.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "SettingTimerTableViewCell.h"

@implementation SettingTimerTableViewCell
{
    UIImageView *bgImageView;
}
- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
