//
//  FMItemListTableViewController.h
//  SoulFM
//
//  Created by lijinghua on 15/12/19.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Catagory.h"

@interface FMItemListTableViewController : UITableViewController

- (id)initWithCategory:(FMCategoryType)type;

@property(nonatomic)FMCategoryType type;
@property(nonatomic)Catagory       *model;
@end
