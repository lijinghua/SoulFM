//
//  FMBaseViewController.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMBaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy)NSString *fetchEngineConfigrationKey;
@property(nonatomic)UITableView *tableView;
@end
