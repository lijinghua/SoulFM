//
//  TimeStepIndicatorView.m
//  SoulFM
//
//  Created by lijinghua on 15/12/24.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "TimeStepIndicatorView.h"

@implementation TimeStepIndicatorView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextAddArc(context,rect.size.width/2, rect.size.width/2, rect.size.width/2-2, 0, M_PI*2, YES);
    CGContextStrokePath(context);
    CGContextFillEllipseInRect(context, CGRectMake(5, 5, 10, 10));
}

@end
