//
//  FMReaderInfoEngine.m
//  SoulFM
//
//  Created by lijinghua on 16/1/25.
//  Copyright © 2016年 lijinghua. All rights reserved.
//

#import "FMReaderInfoEngine.h"
#import "ReaderInfoModel.h"

@implementation FMReaderInfoEngine

- (void)customFetchParameter{
    [super customFetchParameter];
    [self setRequestValue:[self requestUrl] forKey:kRequestUrlKey];
}

- (NSString*)requestUrl{
    NSString *modelId = [self.paramter objectForKey:@"modelId"];
    return [NSString stringWithFormat:FmHostPersonalUrl,modelId];
}

- (id)parseResondData:(id)respondObject{
    NSDictionary *dic = respondObject[@"data"];
    ReaderInfoModel *model = [[ReaderInfoModel alloc]initWithDictionary:dic error:nil];
    return model;
}


@end
