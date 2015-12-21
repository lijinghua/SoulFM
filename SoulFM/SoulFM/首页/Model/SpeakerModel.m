//
//  SpeakerModel.m
//  SoulFM
//
//  Created by lijinghua on 15/12/21.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "SpeakerModel.h"

@implementation SpeakerModel

- (id)initWithDictionary:(NSDictionary*)dictionary
{
    if (self = [super init]) {
        self.brief = dictionary[@"brief"];
        NSDictionary *userDic = dictionary[@"user"];
        self.id  = userDic[@"id"];
        self.nickname = userDic[@"nickname"];
        self.avatar   = userDic[@"avatar"];
    }
    return self;
}
@end
