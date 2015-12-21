//
//  FMContentModel.h
//  SoulFM
//
//  Created by lijinghua on 15/12/21.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpeakerModel.h"
#import "UserGiftModel.h"

@interface FMContentModel : NSObject

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *viewnum;
@property(nonatomic,copy)NSString *cover;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,strong)SpeakerModel *speaker;
@property(nonatomic,strong)NSArray      *userGiftList;
@property(nonatomic,strong)NSNumber     *duration;

- (id)initWithDictionary:(NSDictionary*)dictionary;

- (void)updateContent:(FMContentModel*)model;

@end
