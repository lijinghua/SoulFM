//
//  FMNetEngine.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const kRequestMethodKey = @"requestMethodKey";
static NSString * const kRequestUrlKey    = @"requestUrl";



typedef void(^SuccessBlockType) (id object);
typedef void(^FailedBlockType)  (NSError *error);

@protocol FMNetEngineDelegate;
@interface FMNetEngine : NSObject


@property(nonatomic)NSMutableDictionary     *paramter;
@property(nonatomic,copy)SuccessBlockType successBlock;
@property(nonatomic,copy)FailedBlockType  faliedBlock;
@property(nonatomic,weak)id<FMNetEngineDelegate> delegate;

//配置参数信息
- (void)setRequestValue:(id)object forKey:(NSString*)key;
- (void)setRequestTag:(NSInteger)tag;
- (NSInteger)requtestTag;

//配置数据
- (void)customFetchParameter;
- (void)fetchNetworkData;


@end
