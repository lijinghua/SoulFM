//
//  FMDefine.h
//  SoulFM
//
//  Created by lijinghua on 15/12/11.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#ifndef FMDefine_h
#define FMDefine_h

// 首页
#define FMHomeUrl @"http://yiapibox.xinli001.com/fm/home-list.json?key=c0d28ec0954084b4426223366293d190"
// 首页分类
#define FMHomeCategoryUrl @"http://yiapibox.xinli001.com/fm/category-jiemu-list.json?key=c0d28ec0954084b4426223366293d190&offset=%d&category_id=%@&limit=20"

// 首页更多心理课
#define FMHomeXinliUrl @"http://yiapibox.xinli001.com/fm/newlesson-list.json?key=c0d28ec0954084b4426223366293d190&limit=20&offset=%d"
// 首页更多FM
#define FMHomeFMUrl @"http://yiapibox.xinli001.com/fm/diantai-jiemu-list.json?diantai_id=1009&key=c0d28ec0954084b4426223366293d190&offset=%d&limit=20"
// 首页更多电台
#define FMHomeDiantaiUrl @"http://yiapibox.xinli001.com/fm/diantai-page.json?key=c0d28ec0954084b4426223366293d190"
#define FmHomeMoreHostUrl @"http://yiapibox.xinli001.com/fm/diantai-new-list.json?key=c0d28ec0954084b4426223366293d190&limit=20&offset=0"
// 首页中秋
#define FMHeadUrl @"http://bapi.xinli001.com/fm2/broadcast_list.json/?rows=15&offset=%ld&key=c0d28ec0954084b4426223366293d190&tag=%@"


// 主播详情
#define FmHostDetailUrl @"http://yiapibox.xinli001.com/fm/diantai-jiemu-list.json?diantai_id=%@&key=c0d28ec0954084b4426223366293d190&offset=0&limit=20"
#define FmHostPersonalUrl @"http://yiapibox.xinli001.com/fm/diantai-detai.json?key=c0d28ec0954084b4426223366293d190&id=%@"


// FM详情
#define FmDetailUrl @"http://yiapi.xinli001.com/fm/broadcast-detail-old.json?key=c0d28ec0954084b4426223366293d190&id=%@"

// 发现页面
#define FMDiscHeadView @"http://bapi.xinli001.com/fm2/hot_tag_list.json/?flag=4&key=c0d28ec0954084b4426223366293d190&rows=3&offset=0"
#define FMDiscFootView @"http://yiapibox.xinli001.com/fm/diantai-find-list.json?key=c0d28ec0954084b4426223366293d190&rows=6&offset=0"

#define FMSearchUrl @"http://bapi.xinli001.com/fm2/hot_tag_list.json/?flag=1&key=c0d28ec0954084b4426223366293d190&rows=10&offset=0"

#define FMDiscMoodAndTroubleUrl @"http://bapi.xinli001.com/fm2/broadcast_list.json/?rows=15&offset=%d&key=c0d28ec0954084b4426223366293d190&tag=%@"

#define FMDiscHosturl @"http://yiapibox.xinli001.com/fm/diantai-find-list.json?key=c0d28ec0954084b4426223366293d190&rows=10&offset=%d"

#define FMDiscSearchUrl @"http://bapi.xinli001.com/fm2/broadcast_list.json/?rows=15&offset=0&q=%@&key=c0d28ec0954084b4426223366293d190"
#define FMDiscSearchKeyUrl @"http://bapi.xinli001.com/fm2/hot_tag_list.json/?flag=1&key=c0d28ec0954084b4426223366293d190&rows=10&offset=0"


// 社区页面 精华
#define FMCommunityUrl @"http://yiapi.xinli001.com/fm/forum-thread-list.json?flag=0&size=10&key=c0d28ec0954084b4426223366293d190&offset=0&type=%d"
#define FMCommunityDetailUrl @"http://yiapi.xinli001.com/fm/forum-comment-list.json?post_id=%@&key=c0d28ec0954084b4426223366293d190&offset=%d&limit=10"

#define FMCommunityPersonal @"http://bapi.xinli001.com/fm2/favorite_list.json/?key=c0d28ec0954084b4426223366293d190&rows=10&offset=0&user_id=%@"



#endif /* FMDefine_h */
