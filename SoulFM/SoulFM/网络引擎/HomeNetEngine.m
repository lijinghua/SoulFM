//
//  HomeNetEngine.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HomeNetEngine.h"
#import "HomeModel.h"

@interface HomeNetEngine ()
@property(nonatomic)HomeModel *homeModel;
@end

@implementation HomeNetEngine

- (void)customFetchParameter
{
    self.method = GET;
    self.url    = FMHomeUrl;
    
    typeof(self) weakSelf = self;
    self.successBlock = ^(id respondObject){

        //解析网络数据
        weakSelf.homeModel = [[HomeModel alloc]initWithDictionary:respondObject[@"data"] error:nil];
        if ([weakSelf.delegate respondsToSelector:@selector(netEngine:dataSource:)]) {
            [weakSelf.delegate netEngine:weakSelf dataSource:weakSelf.homeModel];
        }
    };
    
    self.faliedBlock = ^(NSError *error){
    };
}


@end
