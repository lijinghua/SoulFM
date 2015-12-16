//
//  FMTabBarViewController.m
//  SoulFM
//
//  Created by lijinghua on 15/12/16.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "FMTabBarViewController.h"
#import "TabbarItem.h"
#import "UIViewController+TabBarItem.h"

@interface FMTabBarViewController ()
@property(nonatomic)NSMutableArray *tabBarItemArray;
@end

@implementation FMTabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBg@2x.png"]];
    [self loadTabBarItem];
    [self createTabBarContentViewControllers];
}




- (void)loadTabBarItem{
    self.tabBarItemArray = [NSMutableArray array];
    NSString *itemFilePath = [[NSBundle mainBundle] pathForResource:@"Itemslist" ofType:@"plist"];
    NSArray *itemArray = [NSArray arrayWithContentsOfFile:itemFilePath];
    for (NSDictionary *dic  in itemArray) {
        TabbarItem *tabItem = [TabbarItem itemWithDictionary:dic];
        [self.tabBarItemArray addObject:tabItem];
    }
}

- (void)createTabBarContentViewControllers{
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (TabbarItem *item in self.tabBarItemArray) {
        UIViewController *viewController = [NSClassFromString(item.className) viewContrllerTitle:item.title normalImage:item.normalImageName selectImageName:item.selectedImageName];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
        [viewControllers addObject:nav];
    }
    self.viewControllers = viewControllers;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
