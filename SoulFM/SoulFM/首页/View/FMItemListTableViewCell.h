//
//  FMItemListTableViewCell.h
//  SoulFM
//
//  Created by lijinghua on 15/12/19.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotFMModel.h"

@interface FMItemListTableViewCell : UITableViewCell

- (void)updateWithModel:(HotFMModel*)model;

@end
