//
//  LFirstViewController.m
//  ApplePai
//
//  Created by bwfstu on 16/6/2.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "LFirstViewController.h"
#import "SDCycleScrollView.h"

@interface LFirstViewController ()<SDCycleScrollViewDelegate>

@end

@implementation LFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createCyc];
  
    // Do any additional setup after loading the view.
}
-(void)createCyc{
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, LSIZE.width, LSIZE.height)];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 200);
    [self.view addSubview:demoContainerView];
    
    NSArray *imagesURLStrings = @[
                                  @"http://up.boohee.cn/house/u/tm25/success/chenshumo/banner_v1.jpg",
                                  @"http://up.boohee.cn/house/u/food_library/home_banner/banner1.jpg",
                                  @"http://up.boohee.cn/house/u/food_library/banner/160518/banner.jpg",
                                  @"http://up.boohee.cn/house/u/food_library/banner/160518/banner.png"
                                  ];
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0, LSIZE.width, 200) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    //    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    cycleScrollView2.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    cycleScrollView2.autoScrollTimeInterval = 2.0;
    [demoContainerView addSubview:cycleScrollView2];
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
    
    

}
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"你点击了第%ld张图片",index);
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
