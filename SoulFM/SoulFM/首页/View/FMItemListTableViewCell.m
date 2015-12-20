//
//  FMItemListTableViewCell.m
//  SoulFM
//
//  Created by lijinghua on 15/12/19.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMItemListTableViewCell.h"

@interface FMItemListTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *itemTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *readerLabel;
@property (weak, nonatomic) IBOutlet UILabel *listenerNumberLabel;
@end

@implementation FMItemListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)updateWithModel:(HotFMModel*)model
{
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    self.itemTitleLabel.text = model.title;
    self.readerLabel.text    = model.speak;
    self.listenerNumberLabel.text = [NSString stringWithFormat:@"收听量 %@",model.viewnum];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
