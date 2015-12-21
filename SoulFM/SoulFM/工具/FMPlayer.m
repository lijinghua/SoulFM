//
//  FMPlayer.m
//  SoulFM
//
//  Created by lijinghua on 15/12/21.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface FMPlayer ()
@property(nonatomic)AVPlayer *player;
@end

@implementation FMPlayer

+ (instancetype)sharedInstance
{
    static FMPlayer *s_FMPlayer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_FMPlayer = [[FMPlayer alloc] init];
    });
    return s_FMPlayer;
}

- (void)stop{
    [self.player.currentItem removeObserver:self forKeyPath:@"status"];
    [self.player replaceCurrentItemWithPlayerItem:nil];
    [self.player pause];
    self.player = nil;
}

- (void)pause{
    [self.player pause];
}

- (void)resume{
    if (self.player) {
        [self.player play];
    }
}

- (void)playerFMAtUrl:(NSString*)url
{
    [self stop];
    AVURLAsset *asset = [AVURLAsset assetWithURL:[NSURL URLWithString:url]];
    AVPlayerItem *item = [AVPlayerItem playerItemWithAsset:asset];
    self.player = [[AVPlayer alloc]initWithPlayerItem:item];
    [item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerItem *item = (AVPlayerItem*)object;
        if (item.status == AVPlayerItemStatusReadyToPlay) {
            [self.player play];
            self.duration = CMTimeGetSeconds(item.duration);
            __weak typeof(self) weakSelf = self;
            [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
                Float64 current = CMTimeGetSeconds(time);
                weakSelf.progress = current*1.0/weakSelf.duration;
                NSLog(@"progress %f",weakSelf.progress);
            }];
        }else{
            NSLog(@"播放FM失败");
        }
    }
}
@end
