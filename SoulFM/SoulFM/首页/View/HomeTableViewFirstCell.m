//
//  HomeTableViewFirstCell.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HomeTableViewFirstCell.h"
#import "TuiJianModel.h"

@implementation HomeTableViewFirstCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.autoScrollView];
    }
    return  self;
}

- (AutoScrollView*)autoScrollView
{
    if (_autoScrollView == nil) {
        _autoScrollView = [[AutoScrollView alloc]initWithFrame:self.bounds imageArray:nil];
        _autoScrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        
    }
    return _autoScrollView;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //_autoScrollView.frame = CGRectMake(0, 0, kScreenWidth, self.bounds.size.height);
    _autoScrollView.backgroundColor = [UIColor blueColor];
    NSLog(@"---%@",NSStringFromCGRect(_autoScrollView.frame));
}

- (void)upateWithModelArray:(NSArray*)modelArray;
{
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int index = 0; index < modelArray.count; index++) {
        TuiJianModel *model = [modelArray objectAtIndex:index];
        [imageArray addObject:model.cover];
    }
    [_autoScrollView setImageArray:imageArray];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
