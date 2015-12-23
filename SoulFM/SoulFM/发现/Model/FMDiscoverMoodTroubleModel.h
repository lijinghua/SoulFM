//
//  FMDiscoverMoodTroubleModel.h
//  SoulFM
//
//  Created by lijinghua on 15/12/23.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMDiscoverMoodTroubleModel : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *iconImageView;

+ (NSArray *)paringDataFromLocaltrouble;
+ (NSArray *)paringDataFromLocalmood;

@end
