//
//  ReaderHeadView.m
//  SoulFM
//
//  Created by lijinghua on 16/1/25.
//  Copyright © 2016年 lijinghua. All rights reserved.
//

#import "ReaderHeadView.h"

@interface ReaderHeadView()
@property (weak, nonatomic) IBOutlet UIImageView *readBackgrondImageView;
@property (weak, nonatomic) IBOutlet UIImageView *readerAvadarImageView;
@property (weak, nonatomic) IBOutlet UILabel *readerName;
@property (weak, nonatomic) IBOutlet UILabel *listenerLabel;
@property (weak, nonatomic) IBOutlet UILabel *readerDescriptionLabel;

@end

@implementation ReaderHeadView

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
         }
    return self;
}

- (void)awakeFromNib{
    self.readerAvadarImageView.layer.cornerRadius = 48.0/2;
    self.readerAvadarImageView.layer.masksToBounds = YES;
}

- (void)updateUIWith:(ReaderInfoModel*)model{
    [self.readBackgrondImageView sd_setImageWithURL:[NSURL URLWithString:model.gcover]];
    [self.readerAvadarImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    self.readerName.text = model.title;
    self.listenerLabel.text = [NSString stringWithFormat:@"收听 %@ | 关注 %@",model.viewnum,model.favnum];
    self.readerDescriptionLabel.text = model.content;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
