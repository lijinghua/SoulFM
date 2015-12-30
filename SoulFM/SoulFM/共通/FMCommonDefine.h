//
//  FMCommonDefine.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#ifndef FMCommonDefine_h
#define FMCommonDefine_h

#define SCREEN_RECT     [UIScreen mainScreen].bounds
#define  kScreenWidth   SCREEN_RECT.size.width
#define  kScreenHeight  SCREEN_RECT.size.height

//播放放中的通知
#define FMPlayingNotification     @"fmplaying"

//停止播放的通知
#define FMPlayingStopNotification @"fmstop"


typedef NS_ENUM(NSInteger,FMCategoryType) {
    COMMON           = 1,
    MORE_PSYCHOLOGY  = 2,
    MORE_FM          = 3,
    MORE_DIANTAI     = 4,
};

#endif /* FMCommonDefine_h */
