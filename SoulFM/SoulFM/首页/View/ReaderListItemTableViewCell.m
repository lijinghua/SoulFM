//
//  ReaderListItemTableViewCell.m
//  SoulFM
//
//  Created by lijinghua on 16/1/25.
//  Copyright © 2016年 lijinghua. All rights reserved.
//

#import "ReaderListItemTableViewCell.h"

@implementation ReaderListItemTableViewCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)updateUIWith:(ReaderContentListModel*)model{
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    self.dianTaiLabel.text = model.title;
    self.numberLabel.text = [NSString stringWithFormat:@"收听 %@",model.viewnum];
}

@end
