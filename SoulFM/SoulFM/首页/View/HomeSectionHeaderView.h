//
//  HomeSectionHeaderView.h
//  SoulFM
//
//  Created by lijinghua on 15/12/17.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeSectionHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)setColor:(UIColor*)color title:(NSString*)title;

@end
