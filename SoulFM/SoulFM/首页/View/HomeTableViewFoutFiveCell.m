//
//  HomeTableViewFoutFiveCell.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HomeTableViewFoutFiveCell.h"
@interface HomeTableViewFoutFiveCell()
@property (weak, nonatomic) IBOutlet UILabel *speakerLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@end

@implementation HomeTableViewFoutFiveCell

- (void)awakeFromNib {
}

- (void)updateWithModel:(HotFMModel*)model
{
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:nil];
    self.titleLabel.text = model.title;
    self.speakerLabel.text = model.speak;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
