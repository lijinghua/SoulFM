//
//  FMNetEngineDelegate.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMNetEngine;
@class JSONModel;

@protocol FMNetEngineDelegate <NSObject>

//网络引擎代理
- (void)netEngine:(FMNetEngine*)engine dataSource:(JSONModel*)model;

@end
