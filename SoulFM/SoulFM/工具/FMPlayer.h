//
//  FMPlayer.h
//  SoulFM
//
//  Created by lijinghua on 15/12/21.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMPlayer : NSObject

@property(nonatomic)Float64 duration;
@property(nonatomic)CGFloat progress;

+ (instancetype)sharedInstance;

- (void)playerFMAtUrl:(NSString*)url;
- (void)stop;
- (void)pause;
- (void)resume;
- (BOOL)isPlaying;

@end
