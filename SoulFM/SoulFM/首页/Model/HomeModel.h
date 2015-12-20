//
//  HomeModel.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <JSONModel/JSONModel.h>

#import "FMNewFM.h"
#import "FMNewLession.h"
#import "DianTaiModel.h"
#import "Catagory.h"
#import "TuiJianModel.h"

@protocol HomeModel @end
@interface HomeModel : JSONModel

@property(nonatomic)NSArray<TuiJianModel>      *tuijian;
@property(nonatomic)NSArray<HotFMModel>        *newlesson;
@property(nonatomic)NSArray<HotFMModel>        *newfm;
@property(nonatomic)NSArray<HotFMModel>        *hotfm;
@property(nonatomic)NSArray<Catagory>          *category;
@property(nonatomic)NSArray<DianTaiModel>      *diantai;


- (NSArray*)allModelForKey:(NSString*)modelKey;

@end
