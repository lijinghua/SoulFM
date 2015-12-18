//
//  FMNetEngine.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlockType) (id object);
typedef void(^FailedBlockType)  (NSError *error);

typedef NS_ENUM(NSInteger,FMFetchMethod){
    GET  = 0,
    POST = 1
};

@protocol FMNetEngineDelegate;
@interface FMNetEngine : NSObject

@property(nonatomic,assign)FMFetchMethod  method;
@property(nonatomic,copy)NSString         *url;
@property(nonatomic,copy)NSDictionary     *paramter;
@property(nonatomic,copy)SuccessBlockType successBlock;
@property(nonatomic,copy)FailedBlockType  faliedBlock;

@property(nonatomic,weak)id<FMNetEngineDelegate> delegate;

//配置数据
- (void)fetchNetworkData;

@end
