//
//  AppDelegate.m
//  ApplePai
//
//  Created by bwfstu on 16/6/2.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "AppDelegate.h"
#import "LRootViewController.h"
#import "LFirstViewController.h"
#import "LSecondViewController.h"
#import "LThirdViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    LFirstViewController *firstVC = [[LFirstViewController alloc]init];
    LSecondViewController *secondVC = [[LSecondViewController alloc]init];
    LThirdViewController *thirdVC = [[LThirdViewController alloc]init];
    
    UITabBarController *tabVC = [[UITabBarController alloc]init];
    tabVC.viewControllers = @[[[UINavigationController alloc]initWithRootViewController:firstVC],[[UINavigationController alloc]initWithRootViewController:secondVC],[[UINavigationController alloc]initWithRootViewController:thirdVC]];
    
    //    设置tabBar类型（也就是颜色 黑，白）
    tabVC.tabBar.barStyle = UIBarStyleBlack;
    //    设置tabBar的半透明度
    tabVC.tabBar.translucent = NO;
    //    设置tabBar的颜色
    tabVC.tabBar.barTintColor = [UIColor whiteColor];
    //    设置tabBar镂空部分的颜色
    tabVC.tabBar.tintColor = [UIColor redColor];
    
    NSArray *arr = @[@"逛吃",@"食物百科",@"我的"];
    NSArray *image = @[@"home",@"search",@"my"];
    for (int i=0; i<arr.count; i++) {
        UIViewController *VC = tabVC.viewControllers[i];
        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:arr[i] image:[[UIImage imageNamed:[NSString stringWithFormat:@"ic_tab_%@_default.png",image[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:[NSString stringWithFormat:@"ic_tab_%@_highlight.png",image[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        VC.tabBarItem = item;
    }
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
    return YES;


    // Override point for customization after application launch.
    return YES;
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
