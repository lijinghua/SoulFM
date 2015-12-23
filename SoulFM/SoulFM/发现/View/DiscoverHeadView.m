//
//  DiscoverHeadView.m
//  SoulFM
//
//  Created by lijinghua on 15/12/23.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "DiscoverHeadView.h"
#import "FMDiscoverHeadModel.h"

@implementation DiscoverHeadView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.autoScrollView = [[AutoScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 250) imageArray:nil];
    [self addSubview:self.autoScrollView];
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.autoScrollView.frame = CGRectMake(0, 0, frame.size.width, 250);
    self.autoScrollView.backgroundColor = [UIColor redColor];
}

- (void)updateHeadView:(NSArray*)headDataArray
{
    NSMutableArray *array = [NSMutableArray array];
    for (FMDiscoverHeadModel *headModel in headDataArray) {
        [array addObject:headModel.cover];
    }
    [self.autoScrollView setImageArray:array];
}

@end
