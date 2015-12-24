//
//  FMCommunityNetEngine.m
//  SoulFM
//
//  Created by lijinghua on 15/12/23.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMCommunityNetEngine.h"
#import "CommunityModel.h"

@implementation FMCommunityNetEngine

- (NSArray*)parseResondData:(id)responseData{
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic  in responseData[@"data"]) {
        CommunityModel *model = [[CommunityModel alloc]initWithDictionary:dic error:nil];
        [array addObject:model];
    }
    return array;
}

@end
