//
//  UserGiftModel.h
//  SoulFM
//
//  Created by lijinghua on 15/12/21.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserGiftModel : NSObject

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *nickname;
@property(nonatomic,copy)NSString *avatar;

- (id)initWithDictionary:(NSDictionary*)dictionary;

@end
