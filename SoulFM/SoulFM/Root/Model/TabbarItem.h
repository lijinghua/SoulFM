//
//  TabbarItem.h
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMBaseModel.h"

@interface TabbarItem : FMBaseModel

@property(nonatomic,copy)NSString *selectedImageName;
@property(nonatomic,copy)NSString *normalImageName;
@property(nonatomic,copy)NSString *className;
@property(nonatomic,copy)NSString *title;

- (UIImage*)normalImage;
- (UIImage*)selectedImage;

@end
