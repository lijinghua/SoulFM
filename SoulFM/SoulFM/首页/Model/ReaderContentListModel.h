//
//  ReaderContentListModel.h
//  SoulFM
//
//  Created by lijinghua on 16/1/25.
//  Copyright © 2016年 lijinghua. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ReaderContentListModel : JSONModel

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *cover;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *speak;
@property(nonatomic,copy)NSString *favnum;
@property(nonatomic,copy)NSString *viewnum;
@property(nonatomic,copy)NSString<Optional> *background;
@property(nonatomic,assign)bool is_teacher;
@property(nonatomic,copy)NSString *absolute_url;
@property(nonatomic,copy)NSArray<Ignore> *url_list;

@end
