//
//  CommunityModel.h
//  SoulFM
//
//  Created by lijinghua on 15/12/23.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "UserModel.h"


//"id": "18841",
//"user_id": "1000238690",
//"title": "我是未来的护士姐姐，你呢？",
//"content": "其实一开始我并不喜欢这份工作，但我接受了，所以会我努力。",
//"created": "1日前",
//"updated": "1分钟前",
//"jin": "0",
//"commentnum": "5",
//"user": {
//    "id": "1000238690",
//    "nickname": "。厌人💨",
//    "avatar": "http://ossimg.xinli001.com/20151222/652dc9649685fcbc9d651d6ec0333f56.jpg!80"
//},
//"absolute_url": "http://yiapi.xinli001.com/fm/forum-share-page/18841",
//"images": []

@protocol NSString <NSObject>

@end
@interface CommunityModel : JSONModel

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *user_id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *created;
@property(nonatomic,copy)NSString *updated;
@property(nonatomic,copy)NSString *jin;
@property(nonatomic,copy)NSString *commentnum;
@property(nonatomic,copy)NSString *absolute_url;
@property(nonatomic,copy)NSArray<NSString,Optional> *images;
@property(nonatomic,strong)UserModel *user;
@end
