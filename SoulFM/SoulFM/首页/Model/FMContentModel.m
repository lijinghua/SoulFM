//
//  FMContentModel.m
//  SoulFM
//
//  Created by lijinghua on 15/12/21.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMContentModel.h"

@implementation FMContentModel

- (id)initWithDictionary:(NSDictionary *)dictionary{
    if (self = [super init]) {
        self.id    = dictionary[@"id"];
        self.title = dictionary[@"title"];
        self.cover = dictionary[@"cover"];
        self.url   = dictionary[@"url"];
        self.viewnum = dictionary[@"viewnum"];
        NSDictionary *speakerDic = dictionary[@"speaker"];
        self.speaker = [[SpeakerModel alloc]initWithDictionary:speakerDic];
        NSArray *userListArray = dictionary[@"user_gift_list"];
        self.userGiftList = [self extractUserGiftList:userListArray];
    }
    return self;
}

- (NSArray*)extractUserGiftList:(NSArray*)array
{
    NSMutableArray *retArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        UserGiftModel *model = [[UserGiftModel alloc]initWithDictionary:dic];
        [retArray addObject:model];
    }
    return retArray;
}



@end
