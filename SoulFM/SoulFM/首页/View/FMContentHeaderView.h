//
//  FMContentHeaderView.h
//  SoulFM
//
//  Created by lijinghua on 15/12/21.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMContentModel.h"

@class FMContentHeaderView;
@protocol FMConentHeadViewDelegate <NSObject>

- (void)playPrevFMContent:(FMContentHeaderView*)sender;
- (void)playCurrentFMContent:(FMContentHeaderView*)sender;
- (void)pauseCurrentFMContent:(FMContentHeaderView*)sender;
- (void)playNextFMContent:(FMContentHeaderView*)sender;

@end

@interface FMContentHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *viewNumberLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@property(nonatomic,weak)id<FMConentHeadViewDelegate> delegate;

- (void)updateContent:(FMContentModel*)model;
- (void)updateProgress:(CGFloat)progress;

@end
