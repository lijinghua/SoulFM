//
//  MoreDianTaiModel.h
//  SoulFM
//
//  Created by lijinghua on 16/1/25.
//  Copyright © 2016年 lijinghua. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "DianTaiModel.h"

@interface MoreDianTaiModel : JSONModel
@property(nonatomic)NSArray<DianTaiModel> *tuijian;
@property(nonatomic)NSArray<DianTaiModel> *newlist;
@property(nonatomic)NSArray<DianTaiModel> *hotlist;
@end
