//
//  FMConfigration.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMConfigration.h"

@interface FMConfigration ()

@property(nonatomic)NSMutableDictionary *dicConfig;

@end

@implementation FMConfigration

+ (instancetype)sharedInstance
{
    static  FMConfigration *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[FMConfigration alloc]init];
    });
    return config;
}


- (id)init
{
    if (self = [super init]) {
        self.dicConfig = [NSMutableDictionary dictionary];
        [self.dicConfig setValue:@"HomeNetEngine" forKey:kHomeDataEngine];
        [self.dicConfig setValue:@"ItemListDataEngine" forKey:kFMItemListDataEngine];
        [self.dicConfig setValue:@"FMContentNetEngine" forKey:kFMContentConfigKey];
    }
    return self;
}

- (id)configrationOfKey:(NSString*)key
{
    NSString *value = [self.dicConfig objectForKey:key];
    return [[NSClassFromString(value) alloc]init];
}

@end
