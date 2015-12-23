//
//  FMDiscoverNetEngine.m
//  SoulFM
//
//  Created by lijinghua on 15/12/23.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMDiscoverNetEngine.h"
#import "DianTaiModel.h"
#import "FMDiscoverHeadModel.h"

@implementation FMDiscoverNetEngine

- (NSArray*)parseResondData:(id)respondObject
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic  in respondObject[@"data"]) {
        if ([self isDiscoverHeadData:respondObject]) {
            FMDiscoverHeadModel *model = [[FMDiscoverHeadModel alloc]initWithDictionary:dic error:nil];
            [array addObject:model];
        }else{
            DianTaiModel *model = [[DianTaiModel alloc]initWithDictionary:dic error:nil];
            [array addObject:model];
        }
    }
    return array;
}

- (BOOL)isDiscoverHeadData:(NSDictionary*)respondObject{
    if (respondObject[@"count"] != nil) {
        return YES;
    }
    return NO;
}

@end
