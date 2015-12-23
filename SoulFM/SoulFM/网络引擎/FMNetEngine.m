//
//  FMNetEngine.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMNetEngine.h"
#import "AFNetworking.h"

@interface FMNetEngine ()
@property(nonatomic)AFHTTPRequestOperationManager *opManager;
@end

@implementation FMNetEngine


- (id)init{
    if (self = [super init]) {
        _opManager = [[AFHTTPRequestOperationManager alloc]init];
        _opManager.securityPolicy = [AFSecurityPolicy defaultPolicy];
        NSMutableSet *set = [NSMutableSet setWithSet:_opManager.responseSerializer.acceptableContentTypes];
        [set addObject:@"text/html; charset=UTF-8"];
        [set addObject:@"text/html"];
        _opManager.responseSerializer.acceptableContentTypes = set;
        _paramter = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (void)fetchNetworkData{
    [self customFetchParameter];
    [self excute];
}

- (void)setRequestValue:(id)parameterObject forKey:(NSString*)key
{
    if (parameterObject != nil && key != nil) {
        [_paramter setObject:parameterObject forKey:key];
    }
}


//子类解析数据
- (id)parseResondData:(id)respondObject{
    return nil;
}


- (void)customFetchParameter{
    //默认为GET 请求，子类可以重新订制
    [self setRequestValue:@"GET" forKey:kRequestMethodKey];
    typeof(self) weakSelf = self;
    self.successBlock = ^(id respondObject){
        if ([weakSelf.delegate respondsToSelector:@selector(netEngine:dataSource:)]) {
            [weakSelf.delegate netEngine:weakSelf dataSource:[weakSelf parseResondData:respondObject]];
        }
    };
    
    self.faliedBlock = ^(NSError *error){
        NSLog(@"网络访问异常 %@",error);
    };
}

- (void)GET{
    [self.opManager GET:[[self.paramter objectForKey:kRequestUrlKey] urlEncode] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (self.successBlock) {
            self.successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (self.faliedBlock) {
            self.faliedBlock(error);
        }
    }];
}

- (void)POST{
    [self.opManager POST:[[self.paramter objectForKey:kRequestUrlKey] urlEncode] parameters:self.paramter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (self.successBlock) {
            self.successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (self.faliedBlock) {
            self.faliedBlock(error);
        }
    }];
}

- (void)excute
{
    if([[self.paramter objectForKey:kRequestMethodKey] isEqualToString:@"GET"]){
        [self GET];
    }else{
        [self POST];
    }
}

@end
