//
//  DiscoverCollectionSectionHeaView.h
//  SoulFM
//
//  Created by lijinghua on 15/12/23.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoverCollectionSectionHeaView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *loadMoreButton;

- (void)setTitle:(NSString*)title;
- (void)showMoreInfo:(BOOL)isShow;
@end
