//
//  AutoScrollView.h
//  AutoScoll
//
//  Created by lijinghua on 15/8/19.
//  Copyright (c) 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoScrollView : UIView

- (id)initWithFrame:(CGRect)frame imageArray:(NSArray*)imageArray;

- (void)setImageArray:(NSArray*)imageArray;

@end
