//
//  UserGiftModel.m
//  SoulFM
//
//  Created by lijinghua on 15/12/21.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "UserGiftModel.h"

@implementation UserGiftModel


- (id)initWithDictionary:(NSDictionary*)dictionary
{
    if(self = [super init]){
        self.id       =  dictionary[@"id"];
        self.nickname = dictionary[@"nickname"];
        self.avatar   = dictionary[@"avatar"];
    }
    return self;
}

@end
