//
//  FMDiscoverHeadModel.h
//  SoulFM
//
//  Created by lijinghua on 15/12/23.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface FMDiscoverHeadModel : JSONModel

@property(nonatomic,strong)NSNumber *sort;
@property(nonatomic,copy)  NSString *name;
@property(nonatomic,strong)NSNumber *id;
@property(nonatomic,strong)NSNumber *flag;
@property(nonatomic,copy)  NSString *cover;
@property(nonatomic,copy)  NSString *title;
@property(nonatomic,strong)NSNumber *count;

@end
