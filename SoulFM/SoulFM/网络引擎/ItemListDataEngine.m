//
//  ItemListDataEngine.m
//  SoulFM
//
//  Created by lijinghua on 15/12/19.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "ItemListDataEngine.h"
#import "HotFMModel.h"

@implementation ItemListDataEngine

- (void)customFetchParameter
{
    [self setRequestValue:@"GET" forKey:kRequestMethodKey];
    [super customFetchParameter];
    [self setRequestValue:[self fetchRequestUrl] forKey:kRequestUrlKey];
}

- (NSArray*)parseResondData:(id)respondObject
{
    NSMutableArray *dataSource = [NSMutableArray array];
    for (NSDictionary *dic in respondObject[@"data"]) {
        HotFMModel *model = [[HotFMModel alloc]initWithDictionary:dic error:nil];
        [dataSource addObject:model];
    }
    return  dataSource;
}


- (NSString*)fetchRequestUrl
{
    FMCategoryType type = (FMCategoryType)[[self.paramter objectForKey:@"categoryType"] intValue];
    NSString *modelId = [self.paramter objectForKey:@"typeId"];
    int page = [[self.paramter objectForKey:@"pageNo"] intValue];
    if (type == COMMON) {
        return [NSString stringWithFormat:FMHomeCategoryUrl,page*20,modelId];
    }else if (type == MORE_PSYCHOLOGY) {
        return [NSString stringWithFormat:FMHomeXinliUrl,page*20];
    }else if (type == MORE_FM) {
        return [NSString stringWithFormat:FMHomeFMUrl,page*20];
    }else if (type == MORE_DIANTAI) {
        return [NSString stringWithFormat:FMHomeDiantaiUrl];
    }
    return nil;
}



@end
