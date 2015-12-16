//
//  Catagory.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol Catagory 
@end

@interface Catagory : JSONModel

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *cover;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *sort;
@property(nonatomic,copy)NSString *flag;

@end
