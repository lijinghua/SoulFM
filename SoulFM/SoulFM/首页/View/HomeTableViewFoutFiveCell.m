//
//  HomeTableViewFoutFiveCell.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HomeTableViewFoutFiveCell.h"
#import "FMContentViewController.h"
@interface HomeTableViewFoutFiveCell()
@property (nonatomic)HotFMModel *model;
@property (weak, nonatomic) IBOutlet UILabel *speakerLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@end

@implementation HomeTableViewFoutFiveCell

- (void)awakeFromNib {
    UITapGestureRecognizer *gestureRecoginzer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGestrue:)];
    [self addGestureRecognizer:gestureRecoginzer];
}

- (void)handleTapGestrue:(UITapGestureRecognizer*)gesture{
    FMContentViewController *contentViewController = [[FMContentViewController alloc]init];
    contentViewController.hidesBottomBarWhenPushed = YES;
    //contentViewController.model = self.model;
    //contentViewController.modelArray = self.dataSource;
    UIViewController * controller = [FMUtil firstResondViewController:self];
    [controller.navigationController pushViewController:contentViewController animated:YES];
}

- (void)updateWithModel:(HotFMModel*)model
{
    self.model = model;
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:nil];
    self.titleLabel.text = model.title;
    self.speakerLabel.text = model.speak;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


@end
