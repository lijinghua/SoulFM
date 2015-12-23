//
//  DiscoverCollectionSectionHeaView.m
//  SoulFM
//
//  Created by lijinghua on 15/12/23.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "DiscoverCollectionSectionHeaView.h"

@implementation DiscoverCollectionSectionHeaView

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
}
- (IBAction)loadMoreButtonClick:(id)sender {
}


- (void)setTitle:(NSString*)title
{
    self.titleLabel.text = title;
}

- (void)showMoreInfo:(BOOL)isShow
{
    self.loadMoreButton.hidden = !isShow;
}
@end
