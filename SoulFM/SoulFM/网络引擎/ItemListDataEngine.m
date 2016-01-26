//
//  ItemListDataEngine.m
//  SoulFM
//
//  Created by lijinghua on 15/12/19.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "ItemListDataEngine.h"
#import "HotFMModel.h"
#import "MoreDianTaiModel.h"

@implementation ItemListDataEngine

- (void)customFetchParameter
{
    [self setRequestValue:@"GET" forKey:kRequestMethodKey];
    [super customFetchParameter];
    [self setRequestValue:[self fetchRequestUrl] forKey:kRequestUrlKey];
}

- (id)parseResondData:(id)respondObject
{
    FMCategoryType type = (FMCategoryType)[[self.paramter objectForKey:@"categoryType"] intValue];
    if (type == MORE_DIANTAI) {
        MoreDianTaiModel *model = [[MoreDianTaiModel alloc]initWithDictionary:respondObject[@"data"] error:nil];
        return model;
    }else{
        NSMutableArray *dataSource = [NSMutableArray array];
        for (NSDictionary *dic in respondObject[@"data"]) {
            HotFMModel *model = [[HotFMModel alloc]initWithDictionary:dic error:nil];
            [dataSource addObject:model];
        }
        return  dataSource;
    }
}


- (NSString*)fetchRequestUrl
{
    FMCategoryType type = (FMCategoryType)[[self.paramter objectForKey:@"categoryType"] intValue];
    NSString *modelId   = [self.paramter objectForKey:@"typeId"];
    NSString *modelName = [self.paramter objectForKey:@"modelName"];
    int page = [[self.paramter objectForKey:@"pageNo"] intValue];

    if (type == COMMON) {
        return [NSString stringWithFormat:FMHomeCategoryUrl,page*20,modelId];
    }else if (type == MORE_PSYCHOLOGY) {
        return [NSString stringWithFormat:FMHomeXinliUrl,page*20];
    }else if (type == MORE_FM) {
        return [NSString stringWithFormat:FMHomeFMUrl,page];
    }else if (type == MORE_DIANTAI) {
        return [NSString stringWithFormat:FMHomeDiantaiUrl];
    }else if (type == MOOD_TROUBLE){
        return [NSString stringWithFormat:FMDiscMoodAndTroubleUrl,page*15,modelName];
    }
    return nil;
}



@end
