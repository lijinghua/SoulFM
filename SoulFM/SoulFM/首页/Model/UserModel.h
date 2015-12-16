//
//  UserModel.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface UserModel : JSONModel

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *nickname;
@property(nonatomic,copy)NSString *avatar;

@end
