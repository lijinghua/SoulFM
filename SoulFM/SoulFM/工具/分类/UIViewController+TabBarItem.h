//
//  UIViewController+TabBarItem.h
//  CustomTabBarController
//
//  Created by lijinghua on 15/8/19.
//  Copyright (c) 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TabBarItem)

//定义一个方法，生成viewControleller
//生成UITabBarItem ，对各个项进行赋值
//返回生成的viewController
+ (instancetype)viewContrllerTitle:(NSString*)title normalImage:(NSString*)normalImageName selectImageName:(NSString*)selectImageName;

@end
