//
//  HotFMModel.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "DianTaiModel.h"
#import "ReaderContentListModel.h"

@protocol NSString @end

@protocol HotFMModel 
@end

@interface HotFMModel : JSONModel

+ (HotFMModel*)covertFromReadItemModel:(ReaderContentListModel*)model;

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *cover;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *speak;
@property(nonatomic,copy)NSString *favnum;
@property(nonatomic,copy)NSString *viewnum;
@property(nonatomic,copy)NSString *is_teacher;
@property(nonatomic,copy)NSString *absolute_url;
@property(nonatomic)NSArray<NSString,Optional>  *url_list;
@property(nonatomic,copy)NSString<Optional>     *object_id;
@property(nonatomic,copy)DianTaiModel<Optional> *diantai;
   
@end
