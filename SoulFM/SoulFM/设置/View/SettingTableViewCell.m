//
//  SettingTableViewCell.m
//  SoulFM
//
//  Created by lijinghua on 15/12/24.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "SettingTableViewCell.h"

@interface SettingTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *settingLabel;

@end

@implementation SettingTableViewCell

- (void)awakeFromNib {
    self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"minibg"]];
    self.backgroundColor = [UIColor clearColor];
}

- (void)updateImage:(NSString*)imageName title:(NSString*)title{
    self.iconImageView.image = [UIImage imageNamed:imageName];
    self.settingLabel.text = title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
