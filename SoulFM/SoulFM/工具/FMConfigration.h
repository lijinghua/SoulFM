//
//  FMConfigration.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * kHomeDataEngine       = @"homeDataEngine";
static NSString * kFMItemListDataEngine = @"itemListDateEngine";

@interface FMConfigration : NSObject

+ (instancetype)sharedInstance;

- (id)configrationOfKey:(NSString*)key;

@end
