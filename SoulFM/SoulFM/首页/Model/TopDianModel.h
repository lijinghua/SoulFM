//
//  TopDianModel.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "UserModel.h"

@protocol TopDianModel @end

@interface TopDianModel : JSONModel

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *cover;
@property(nonatomic,copy)NSString *fmnum;
@property(nonatomic,copy)NSString *user_id;
@property(nonatomic,copy)NSString *viewnum;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *favnum;
@property(nonatomic,copy)UserModel *user;

@end
