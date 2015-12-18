//
//  HomeModel.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HomeModel.h"

extern NSString * const kNewLessonModelKey;
extern NSString * const kHotFMModelKey    ;
extern NSString * const kCategoryModelKey ;
extern NSString * const kTuiJianModelKey  ;
extern NSString * const kDianTaiModelKey  ;
extern NSString * const kNewFMModelKey    ;

@implementation HomeModel

- (NSArray*)allModelForKey:(NSString*)modelKey
{
    if ([modelKey isEqualToString:kNewLessonModelKey]) {
        return self.newlesson;
    }else if ([modelKey isEqualToString:kHotFMModelKey]){
        return self.hotfm;
    }else if ([modelKey isEqualToString:kCategoryModelKey]){
        return self.category;
    }else if([modelKey isEqualToString:kTuiJianModelKey]){
        return self.tuijian;
    }else if ([modelKey isEqualToString:kDianTaiModelKey]){
        return self.diantai;
    }else if([modelKey isEqualToString:kNewFMModelKey]){
        return self.newfm;
    }
    return nil;
}

@end
