//
//  HotFMModel.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "HotFMModel.h"

@implementation HotFMModel

+ (HotFMModel*)covertFromReadItemModel:(ReaderContentListModel*)model
{
    if (model) {
        HotFMModel *hotFMModel = [[[self class] alloc]init];
        hotFMModel.id = model.id;
        hotFMModel.url = model.url;
        hotFMModel.title = model.title;
        hotFMModel.cover = model.cover;
        hotFMModel.speak = model.speak;
        hotFMModel.favnum = model.favnum;
        hotFMModel.viewnum = model.viewnum;
        hotFMModel.absolute_url = model.absolute_url;
        return hotFMModel;
    }
    return nil;
}
@end
