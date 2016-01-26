//
//  FMReaderContentListEngine.m
//  SoulFM
//
//  Created by lijinghua on 16/1/25.
//  Copyright © 2016年 lijinghua. All rights reserved.
//

#import "FMReaderContentListEngine.h"
#import "ReaderContentListModel.h"
@implementation FMReaderContentListEngine

- (void)customFetchParameter{
    [super customFetchParameter];
    [self setRequestValue:[self requestUrl] forKey:kRequestUrlKey];
}

- (NSString*)requestUrl{
    NSString *modelId = [self.paramter objectForKey:@"modelId"];
    NSNumber *pageNo  = [self.paramter objectForKey:@"pageNo"];
    
    return [NSString stringWithFormat:FmHostDetailUrl,modelId,[pageNo integerValue]];
}

- (NSArray*)parseResondData:(id)respondObject{
    NSMutableArray *resultArray = [NSMutableArray array];
    NSArray *returnDataArray = respondObject[@"data"];
    for (NSDictionary *dic  in returnDataArray) {
        ReaderContentListModel *model = [[ReaderContentListModel alloc]initWithDictionary:dic error:nil];
        [resultArray addObject:model];
    }
    return resultArray;
}

@end
