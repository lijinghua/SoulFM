//
//  HomeSectionFooterView.h
//  SoulFM
//
//  Created by lijinghua on 15/12/17.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeSectionFooterView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *indicatorView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)setHomeFootTitle:(NSString*)title;
@end
