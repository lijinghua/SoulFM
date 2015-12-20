//
//  HomeNetEngine.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HomeNetEngine.h"
#import "HomeModel.h"


@implementation HomeNetEngine
- (void)customFetchParameter
{
    [super customFetchParameter];
    [self setRequestValue:@"GET"         forKey:kRequestMethodKey];
    [self setRequestValue:FMHomeUrl      forKey:kRequestUrlKey];
}

- (id)parseResondData:(id)respondObject{
    return [[HomeModel alloc]initWithDictionary:respondObject[@"data"] error:nil];
}

@end
