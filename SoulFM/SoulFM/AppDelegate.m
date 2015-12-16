//
//  AppDelegate.m
//  SoulFM
//
//  Created by lijinghua on 15/12/9.
//  Copyright © 2015年 lijinghua. All rights reserved.
//

#import "AppDelegate.h"
#import "FMTabBarViewController.h"
#import "Reachability.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //全局配置
    [FMConfigration sharedInstance];
    
    self.window = [[UIWindow alloc]initWithFrame:SCREEN_RECT];
    //配置导航栏为通明
    [self transparentNavigationBar];
    FMTabBarViewController *tabBarController = [[FMTabBarViewController  alloc] init];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    [self startLanchAnimationView];
    
    return YES;
}

- (void)startLanchAnimationView
{
    UIImageView *niceView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    niceView.image = [UIImage imageNamed:@"xiong4.7.png"];
    [self.window addSubview:niceView];
    
    [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        niceView.transform = CGAffineTransformMakeScale(1.3, 1.3);
        niceView.alpha = 0.3;
    } completion:^(BOOL finished) {
        [niceView removeFromSuperview];
        [self startMonitorNetwork];
    }];
}


- (void)startMonitorNetwork
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(networkServiceChanged:) name:kReachabilityChangedNotification object:nil];
    Reachability *reachability = [Reachability reachabilityWithHostName:@"http://www.baidu.com"];
    [reachability startNotifier];
}

- (void)networkServiceChanged:(NSNotification*)notify
{
    Reachability *reachablity = notify.object;
    NetworkStatus status = [reachablity currentReachabilityStatus];
    switch (status) {
        case NotReachable:
            [FMUtil showAlterTip:@"网络不通,请检查你的网络"];
            break;
        case ReachableViaWiFi:
            break;
        case ReachableViaWWAN:
            [FMUtil showAlterTip:@"目前网络不是WIFI,建议切换到WIFI"];
            break;
        default:
            break;
    }
}

#pragma mark - AppDeleage Method

- (void)transparentNavigationBar
{
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc]init]];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
