//
//  SpeakerTableViewCell.m
//  SoulFM
//
//  Created by lijinghua on 15/12/21.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "SpeakerTableViewCell.h"

@implementation SpeakerTableViewCell

- (void)awakeFromNib {
    self.iconImageView.layer.cornerRadius = 30;
    self.iconImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateWithModel:(SpeakerModel*)model{
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    self.authorLabel.text = model.nickname;
    self.brifeLabel.text  = model.brief;
}

@end
