//
//  LTabBarViewController.m
//  ApplePai
//
//  Created by bwfstu on 16/6/3.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "LTabBarViewController.h"
#import "LRootViewController.h"
#import "LFirstViewController.h"
#import "LSecondViewController.h"
#import "LThirdViewController.h"

@interface LTabBarViewController ()

@end

@implementation LTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViewController];
    // Do any additional setup after loading the view.
}
- (void)createViewController
{
    LFirstViewController *firstVC = [[LFirstViewController alloc]init];
    LSecondViewController *secondVC = [[LSecondViewController alloc]init];
    LThirdViewController *thirdVC = [[LThirdViewController alloc]init];
    
    self.viewControllers = @[[[UINavigationController alloc]initWithRootViewController:firstVC],[[UINavigationController alloc]initWithRootViewController:secondVC],[[UINavigationController alloc]initWithRootViewController:thirdVC]];
    
    //    设置tabBar类型（也就是颜色 黑，白）
    self.tabBar.barStyle = UIBarStyleBlack;
    //    设置tabBar的半透明度
    self.tabBar.translucent = NO;
    //    设置tabBar的颜色
    self.tabBar.barTintColor = [UIColor whiteColor];
    //    设置tabBar镂空部分的颜色
    self.tabBar.tintColor = [UIColor redColor];
    
    NSArray *arr = @[@"逛吃",@"食物百科",@"我的"];
    NSArray *image = @[@"home",@"search",@"my"];
    for (int i=0; i<arr.count; i++) {
        UIViewController *VC = self.viewControllers[i];
        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:arr[i] image:[[UIImage imageNamed:[NSString stringWithFormat:@"ic_tab_%@_default.png",image[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:[NSString stringWithFormat:@"ic_tab_%@_highlight.png",image[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        VC.tabBarItem = item;
    }
    self.selectedIndex = 1;

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
