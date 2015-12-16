//
//  TuiJianModel.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol TuiJianModel 
@end

@interface TuiJianModel : JSONModel

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *cover;
@property(nonatomic,copy)NSString *value;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *sort;

@end
