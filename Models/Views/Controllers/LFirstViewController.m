//
//  LFirstViewController.m
//  ApplePai
//
//  Created by bwfstu on 16/6/2.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "LFirstViewController.h"
#import "SDCycleScrollView.h"
#import "LFirstTableViewCell.h"
#import "FeedModel.h"
#import "LFirst2ViewController.h"
@interface LFirstViewController ()<SDCycleScrollViewDelegate>

@end

@implementation LFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSourceArr = [NSMutableArray array];
    self.page = 1;
    [self prepareData];
    [self createTableVWithFrame:CGRectMake(0, 0, LSIZE.width, LSIZE.height-44) ];
    [self createCyc];
    // Do any additional setup after loading the view.
}

-(void)prepareData{
    NSString *string = [NSString stringWithFormat:FEED,self.page];
    [self prepareDataGetUrlWithString:string];
}
#pragma mark 轮播图创建及代理方法
-(void)createCyc{
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, LSIZE.width,160*LSCREENSCALE)];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 160*LSCREENSCALE);
    [self.tableV setTableHeaderView:demoContainerView];
    
    NSArray *imagesURLStrings = @[
                                  @"http://up.boohee.cn/house/u/tm25/success/chenshumo/banner_v1.jpg",
                                  @"http://up.boohee.cn/house/u/food_library/home_banner/banner1.jpg",
                                  @"http://up.boohee.cn/house/u/food_library/banner/160518/banner.jpg",
                                  @"http://up.boohee.cn/house/u/food_library/banner/160518/banner.png"
                                  ];
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0, LSIZE.width, 160*LSCREENSCALE) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
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


#pragma mark - tableView相关
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
  
    
    LFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
       
        cell = [[LFirstTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
   
    FeedModel *model;
    if (self.dataSourceArr.count) {
        model = self.dataSourceArr[indexPath.row];
                cell.model = model;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FeedModel *model = self.dataSourceArr[indexPath.row];
    NSInteger i = 0;
    if (model.background.length) {
        i = 200;
    }else{
        i = 160;
    }
    
    return i*LSCREENSCALE;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FeedModel *model = self.dataSourceArr[indexPath.row];
    LFirst2ViewController *first2VC = [[LFirst2ViewController alloc]init];
    first2VC.hidesBottomBarWhenPushed = YES;
    first2VC.link = model.link;
    [self.view.superview setTransitionAnimationType:CCXTransitionAnimationTypeCube toward:CCXTransitionAnimationTowardFromRight duration:0.5];
    [self.navigationController pushViewController:first2VC animated:YES];
}

#pragma mark - 准备数据
-(void)getDataSourceWithObject:(id)object{
    NSArray *arr = [(NSDictionary *)object objectForKey:@"feeds"];
    [self.dataSourceArr addObjectsFromArray:[FeedModel arrayOfModelsFromDictionaries:arr error:nil]];
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
