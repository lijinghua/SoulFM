//
//  FMBaseViewController.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMBaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,FMNetEngineDelegate>

@property(nonatomic,copy)NSString *fetchEngineConfigrationKey;
@property(nonatomic)UITableView *tableView;

@property(nonatomic)NSMutableArray *playingImgArray;
@property(nonatomic)NSMutableArray *pausingImgArray;
@property(nonatomic)UIImageView    *playingIndicatorView;

@end
