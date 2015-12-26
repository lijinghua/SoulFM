//
//  TimerStepContainerView.m
//  SoulFM
//
//  Created by lijinghua on 15/12/24.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "TimerStepContainerView.h"
#import "TimerStepView.h"
#import "TimeStepIndicatorView.h"

@implementation TimerStepContainerView
{
    TimeStepIndicatorView *_indicatorView;
}
- (void)awakeFromNib{
    [self addMinutesView];
    [self addStepView];
    [self addIndicatorView];
}

- (void)addMinutesView{
    NSArray *array = @[@"15分",@"30分",@"45分",@"60分"];
    for (int index = 0; index < 4; index++ ) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.tag  = 200 + index;
        label.font = [UIFont systemFontOfSize:9];
        label.textColor = [UIColor darkGrayColor];
        label.text = [array objectAtIndex:index];
        [self addSubview:label];
    }
}

- (void)addStepView{
    for (int index = 0; index < 4; index++ ) {
        TimerStepView *stepView = [[TimerStepView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        stepView.tag = 100 + index;
        [self addSubview:stepView];
        UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
        [stepView addGestureRecognizer:gestureRecognizer];
    }
}

- (void)addIndicatorView{
    _indicatorView = [[TimeStepIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [self addSubview:_indicatorView];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
    [_indicatorView addGestureRecognizer:panGesture];
}

- (void)handleTapGesture:(UITapGestureRecognizer*)tap
{
    UIView *view = tap.view;
    [UIView animateWithDuration:1 animations:^{
        _indicatorView.center = view.center;
        NSInteger index = [self endIndicatorCenterIndex];
        [self updateTitleAtIndex:index];
    }];
}

- (void)handlePanGesture:(UIPanGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [gesture translationInView:self];
        CGPoint newCenter = CGPointMake(_indicatorView.center.x + point.x, _indicatorView.center.y);
        _indicatorView.center = newCenter;
        
        NSInteger index = [self endIndicatorCenterIndex];
        [self updateTitleAtIndex:index];
        
        [gesture setTranslation:CGPointZero inView:self];
    }else if (gesture.state == UIGestureRecognizerStateEnded){
        NSInteger index = [self endIndicatorCenterIndex];
        [self updateTitleAtIndex:index];
        
        UIView *view = [self viewWithTag:100+index];
        [UIView animateWithDuration:1 animations:^{
            _indicatorView.center = CGPointMake(view.center.x, 10);
        }];
    }
}


- (void)updateTitleAtIndex:(NSInteger)index
{
    for (int i = 0; i < 4; i++ ) {
        UILabel *label = [self viewWithTag:200+i];
        if (i == index) {
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:11];
        }else{
            label.textColor = [UIColor darkGrayColor];
            label.font = [UIFont systemFontOfSize:9];
        }
    }
}

- (NSInteger)endIndicatorCenterIndex
{
    CGFloat xOffset = _indicatorView.center.x;
    CGFloat containerWidth = self.bounds.size.width*1.0;
    if (xOffset < 0 || (xOffset > 0 && xOffset < containerWidth/6)) {
        return 0;
    }else if(xOffset >= containerWidth/6 && xOffset < containerWidth/6*2){
        return 1;
    }else if (xOffset >= containerWidth/6*2 && xOffset < containerWidth/6*3){
        return 1;
    }else if (xOffset >= containerWidth/6*3 && xOffset < containerWidth/6*4){
        return 2;
    }else if (xOffset >= containerWidth/6*4 && xOffset < containerWidth/6*5){
        return 2;
    }else if (xOffset > containerWidth/6*5){
        return 3;
    }
    return -1;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat step = self.bounds.size.width/3.0;
    for (int index = 0; index < 4; index++) {
        TimerStepView *view = [self viewWithTag:100+index];
        view.center = CGPointMake(index*step, 10);
        UILabel *label = (UILabel*)[self viewWithTag:200+index];
        label.center = CGPointMake(index*step, -8);
    }
    _indicatorView.center = CGPointMake(0, 10);
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor groupTableViewBackgroundColor].CGColor);
    CGContextFillRect(context, CGRectInset(rect, 5, 5));
}


@end
