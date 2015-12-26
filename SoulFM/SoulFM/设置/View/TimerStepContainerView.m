//
//  TimerStepContainerView.m
//  SoulFM
//
//  Created by lijinghua on 15/12/24.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "TimerStepContainerView.h"
#import "TimerStepView.h"

@implementation TimerStepContainerView

- (void)awakeFromNib{
    [self addStepView];
}

- (void)addStepView{
    for (int index = 0; index < 4; index++ ) {
        TimerStepView *stepView = [[TimerStepView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        stepView.tag = 100 + index;
        [self addSubview:stepView];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat step = self.bounds.size.width/3.0;
    for (int index = 0; index < 4; index++) {
        TimerStepView *view = [self viewWithTag:100+index];
        view.center = CGPointMake(index*step, 10);
    }
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor groupTableViewBackgroundColor].CGColor);
    CGContextFillRect(context, CGRectInset(rect, 5, 5));
}


@end
