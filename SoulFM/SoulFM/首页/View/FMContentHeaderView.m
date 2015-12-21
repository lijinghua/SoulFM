//
//  FMContentHeaderView.m
//  SoulFM
//
//  Created by lijinghua on 15/12/21.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMContentHeaderView.h"

@interface FMContentHeaderView ()
@property(nonatomic)BOOL isPlaying;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@end

@implementation FMContentHeaderView

- (void)awakeFromNib{
    self.slider.minimumValue = 0.0;
    self.slider.maximumValue = 1.0;
    self.slider.value        = 0.0;
    self.slider.minimumTrackTintColor = [UIColor orangeColor];
    [self.slider setThumbImage:[UIImage imageNamed:@"progress_btn.png"] forState:UIControlStateNormal];
}

- (IBAction)playPreContent:(id)sender {
    if ([self.delegate respondsToSelector:@selector(playPrevFMContent:)]) {
        [self.delegate playPrevFMContent:self];
    }
}

- (IBAction)playNextContent:(id)sender {
    if ([self.delegate respondsToSelector:@selector(playNextFMContent:)]) {
        [self.delegate playNextFMContent:self];
    }
}

- (IBAction)playPauseContent:(id)sender {
    if (self.isPlaying) {
        [self pauseFMContent];
        [self.playButton setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    }else{
        [self playFMContent];
        [self.playButton setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
    }
    self.isPlaying = !self.isPlaying;
}

- (void)playFMContent{
    if ([self.delegate respondsToSelector:@selector(playCurrentFMContent:)]) {
        [self.delegate playCurrentFMContent:self];
    }
}

- (void)pauseFMContent
{
    if ([self.delegate respondsToSelector:@selector(pauseCurrentFMContent:)]) {
        [self.delegate pauseCurrentFMContent:self];
    }
}

- (void)updateContent:(FMContentModel*)model
{
    self.isPlaying = YES;
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    self.titleLabel.text = model.title;
    self.viewNumberLabel.text = [NSString stringWithFormat:@"听众 %@",model.viewnum];
}

- (void)updateProgress:(CGFloat)progress
{
    self.slider.value = progress;
}

@end
