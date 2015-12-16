//
//  FMBaseModel.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMBaseModel.h"

@implementation FMBaseModel

+(instancetype)itemWithDictionary:(NSDictionary*)dic
{
    id item = [[[self class] alloc]init];
    [item setValuesForKeysWithDictionary:dic];
    return item;
}

@end
