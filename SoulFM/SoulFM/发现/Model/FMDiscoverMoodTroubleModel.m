//
//  FMDiscoverMoodTroubleModel.m
//  SoulFM
//
//  Created by lijinghua on 15/12/23.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMDiscoverMoodTroubleModel.h"

@implementation FMDiscoverMoodTroubleModel


// 添加烦恼控件
+ (NSArray *)paringDataFromLocaltrouble {
    NSMutableArray *arr = [NSMutableArray array];
    NSArray *dataKey = @[@"烦躁",@"悲伤",@"孤独",@"已弃疗",@"减压",@"无奈",@"快乐",@"感动",@"迷茫"];
    for (int index = 0; index < 9; index ++) {
        FMDiscoverMoodTroubleModel *model = [[FMDiscoverMoodTroubleModel alloc] init];
        model.name = dataKey[index];
        model.iconImageView = [NSString stringWithFormat:@"emotion%d.png",index+1];
        [arr addObject:model];
    }
    return arr;
}

// 添加心情控件
+ (NSArray *)paringDataFromLocalmood {
    NSMutableArray *arr = [NSMutableArray array];
    NSArray *dataKey = @[@"睡前",@"旅行",@"散步",@"坐车",@"独处",@"失恋",@"失眠",@"随便",@"无聊"];
    for (int index = 0; index < 9; index ++) {
        FMDiscoverMoodTroubleModel *model = [[FMDiscoverMoodTroubleModel alloc] init];
        model.name = dataKey[index];
        model.iconImageView = [NSString stringWithFormat:@"scene%d.png",index+1];
        [arr addObject:model];
    }
    return arr;
}


@end
