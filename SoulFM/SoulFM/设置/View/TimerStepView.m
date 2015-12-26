//
//  TimerStepView.m
//  SoulFM
//
//  Created by lijinghua on 15/12/24.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "TimerStepView.h"

@implementation TimerStepView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor groupTableViewBackgroundColor].CGColor);
    CGContextAddArc(context, rect.size.width/2, rect.size.height/2, rect.size.width/2.0, 0, 2*M_PI, YES);
    CGContextFillPath(context);
}


@end
