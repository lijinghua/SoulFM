//
//  DiscoverHeadView.h
//  SoulFM
//
//  Created by lijinghua on 15/12/23.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoScrollView.h"

@interface DiscoverHeadView : UIView

@property (strong, nonatomic) IBOutlet AutoScrollView *autoScrollView;

- (void)updateHeadView:(NSArray*)headDataArray;
@end
