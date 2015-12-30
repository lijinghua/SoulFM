//
//  FMContentViewController.h
//  SoulFM
//
//  Created by lijinghua on 15/12/19.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotFMModel.h"
#import "FMBaseViewController.h"


@interface FMContentViewController : FMBaseViewController

@property(nonatomic)NSArray       *modelArray;
@property(nonatomic)NSInteger      currentIndex;

//单例
+ (instancetype)sharedInstance;

@end
