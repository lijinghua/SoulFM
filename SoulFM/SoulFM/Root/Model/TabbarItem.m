//
//  TabbarItem.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "TabbarItem.h"

@implementation TabbarItem

- (UIImage*)normalImage
{
    return [UIImage imageNamed:self.normalImageName];
}

- (UIImage*)selectedImage
{
    UIImage *image = [UIImage imageNamed:self.selectedImageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


@end
