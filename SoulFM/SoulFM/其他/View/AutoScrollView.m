//
//  AutoScrollView.m
//  AutoScoll
//
//  Created by lijinghua on 15/8/19.
//  Copyright (c) 2015年 lijinghua. All rights reserved.
//

#import "AutoScrollView.h"

@interface AutoScrollView ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    NSTimer      *_timer;
    
    UIImageView  *_leftImageView;
    UIImageView  *_centerImageView;
    UIImageView  *_rightImageView;
    
    NSArray      *_imageArray;
    UIPageControl *_pageController;
}
@end

@implementation AutoScrollView

- (id)initWithFrame:(CGRect)frame imageArray:(NSArray*)imageArray
{
    if (self = [super initWithFrame:frame]) {
        [self createAutoScrollView];
        [self setImageArray:imageArray];
    }
    
    return self;
}

- (void)createAutoScrollView{
    [self createScrollView];
    [self createContentViews];
    [self createPageControl];
}

- (void)setImageArray:(NSArray *)imageArray{
    if (imageArray.count == 0) {
        return;
    }
    _imageArray = imageArray;
    _pageController.numberOfPages = _imageArray.count;
    
    _leftImageView.tag   = _imageArray.count-1;
    _centerImageView.tag = 0;
    _rightImageView.tag  = 1;
    
    [self updateImageContent];
    [self startTimer];
}

- (void)updateImageContent{
    [self setLeftImageViewImage:[_imageArray objectAtIndex:_leftImageView.tag]];
    [self setCenterImageViewImage:[_imageArray objectAtIndex:_centerImageView.tag]];
    [self setRightImageViewImage:[_imageArray objectAtIndex:_rightImageView.tag]];
}

- (void)createScrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(3*kScreenWidth, self.frame.size.height);
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [_scrollView setContentOffset:CGPointMake(kScreenWidth, 0)];
        [self addSubview:_scrollView];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];

    _leftImageView.frame = CGRectMake(0, 0, kScreenWidth, self.frame.size.height);
    _centerImageView.frame = CGRectMake(kScreenWidth, 0, self.frame.size.width, self.frame.size.height);

    _rightImageView.frame = CGRectMake(kScreenWidth*2, 0, self.frame.size.width, self.frame.size.height);
    _pageController.center = CGPointMake(kScreenWidth/2, self.frame.size.height-20);
    
}

- (void)createContentViews
{
    _leftImageView   = [[UIImageView alloc]initWithFrame:CGRectZero];
    _centerImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    _rightImageView  = [[UIImageView alloc]initWithFrame:CGRectZero];
    
    [_scrollView addSubview:_leftImageView];
    [_scrollView addSubview:_centerImageView];
    [_scrollView addSubview:_rightImageView];
}



- (void)setLeftImageViewImage:(NSString*)imageName
{
    if ([imageName hasPrefix:@"http"]) {
        [_leftImageView sd_setImageWithURL:[NSURL URLWithString:imageName] completed:nil];
    }else{
        [_leftImageView setImage:[UIImage imageNamed:imageName]];
    }
}

- (void)setCenterImageViewImage:(NSString*)imageName
{
    if ([imageName hasPrefix:@"http"]) {
        [_centerImageView sd_setImageWithURL:[NSURL URLWithString:imageName] completed:nil];
    }else{
        [_centerImageView setImage:[UIImage imageNamed:imageName]];
    }
}

- (void)setRightImageViewImage:(NSString*)imageName
{
    if ([imageName hasPrefix:@"http"]) {
        [_rightImageView sd_setImageWithURL:[NSURL URLWithString:imageName] completed:nil];
    }else{
        [_rightImageView setImage:[UIImage imageNamed:imageName]];
    }
}

- (void)createPageControl
{
    _pageController = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];

    _pageController.pageIndicatorTintColor = [UIColor whiteColor];
    _pageController.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:_pageController];
}

- (void)updateContent
{
    if (_scrollView.contentOffset.x > self.frame.size.width) {
        //next
        _leftImageView.tag   = _centerImageView.tag;
        _centerImageView.tag = _rightImageView.tag;
        _rightImageView.tag  = (_rightImageView.tag + 1)%_imageArray.count;
    }else if(_scrollView.contentOffset.x < self.frame.size.width)
    {
        //before
        _rightImageView.tag  = _centerImageView.tag;
        _centerImageView.tag = _leftImageView.tag;
        _leftImageView.tag   = (_leftImageView.tag - 1 + _imageArray.count)%_imageArray.count;
    }

    [self updateImageContent];
    [_scrollView setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
    _pageController.currentPage = _centerImageView.tag;
}

- (void)startTimer
{
    if (_imageArray.count <= 1) return;
    
    [self stopTimer];
    
    _timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)nextPage
{
    if (_scrollView.contentOffset.x != 0) {
        [_scrollView setContentOffset:CGPointMake(self.frame.size.width*2, 0) animated:YES];
    }
}

#pragma mark -
#pragma makr UIScollViewDeleage

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self startTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self updateContent];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self updateContent];
}

@end
