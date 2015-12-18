//
//  HomeTableViewFirstCell.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoScrollView.h"
@interface HomeTableViewFirstCell : UITableViewCell

@property(nonatomic)AutoScrollView *autoScrollView;


- (void)upateWithModelArray:(NSArray*)modelArray;

@end
