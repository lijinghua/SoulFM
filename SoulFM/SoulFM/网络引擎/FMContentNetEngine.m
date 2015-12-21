//
//  FMContentNetEngine.m
//  SoulFM
//
//  Created by lijinghua on 15/12/21.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMContentNetEngine.h"
#import "FMContentModel.h"

@implementation FMContentNetEngine


- (void)customFetchParameter
{
    [super customFetchParameter];
    [self setRequestValue:@"GET" forKey:kRequestMethodKey];
    [self setRequestValue:[self fetchRequestUrl] forKey:kRequestUrlKey];
}

- (NSString*)fetchRequestUrl
{
    NSString *modelId = [self.paramter objectForKey:@"modelId"];
    return [NSString stringWithFormat:FmDetailUrl,modelId];
}

- (FMContentModel*)parseResondData:(id)respondObject
{
    FMContentModel *model = [[FMContentModel alloc]initWithDictionary:respondObject[@"data"]];
    return model;
}

@end
