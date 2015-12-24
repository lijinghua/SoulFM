//
//  CommunityTableViewCell.m
//  SoulFM
//
//  Created by lijinghua on 15/12/23.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "CommunityTableViewCell.h"

@implementation CommunityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)updateWithModel:(CommunityModel*)model
{
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.user.avatar]];
    self.authorLabel.text     = model.user.nickname;
    self.timeLabel.text       = model.created;
    self.commentNumLabel.text = model.commentnum;
    self.titleLabel.text      = model.title;
    self.contentLabel.text    = model.content;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
