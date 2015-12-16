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
    }
    return self;
}

- (void)fetchNetworkData{
    [self customFetchParameter];
    [self excute];
}

//子类重写
- (void)customFetchParameter{}

- (void)GET{
    [self.opManager GET:[self.url urlEncode] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
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
    [self.opManager POST:[self.url urlEncode] parameters:self.paramter success:^(AFHTTPRequestOperation *operation, id responseObject) {
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
    if(self.method == GET){
        [self GET];
    }else{
        [self POST];
    }
}

@end
