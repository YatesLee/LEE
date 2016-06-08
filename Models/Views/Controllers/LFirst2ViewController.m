//
//  LFirst2ViewController.m
//  ApplePai
//
//  Created by bwfstu on 16/6/5.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "LFirst2ViewController.h"
#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"
@interface LFirst2ViewController ()<UIWebViewDelegate,NJKWebViewProgressDelegate>

@end

@implementation LFirst2ViewController{
    UIWebView *_webV;
    NJKWebViewProgress *_webViewProgress;
    NJKWebViewProgressView *_webViewProgressView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createWebView];
    //    [self createToolBar];
    [self createBottomView];
    self.navigationController.title = @"咨询详情";
    // Do any additional setup after loading the view.
}
-(void)createWebView{
    _webV = [[UIWebView alloc]init];
    _webV.frame = CGRectMake(0, 0, LSIZE.width, LSIZE.height - 44);
    _webV.allowsInlineMediaPlayback = YES;
    _webV.allowsPictureInPictureMediaPlayback = YES;
    [self.view addSubview:_webV];
    
    _webViewProgress = [[NJKWebViewProgress alloc]init];
    _webV.delegate = _webViewProgress;
    _webViewProgress.webViewProxyDelegate = self;
    _webViewProgress.progressDelegate = self;
    
    CGRect navBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0,navBounds.size.height - 2,navBounds.size.width,2);
    _webViewProgressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    _webViewProgressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [_webViewProgressView setProgress:0 animated:YES];
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.link]];
    [_webV loadRequest:request];
}
-(void)createToolBar{
    UIToolbar *toolbar = [[UIToolbar alloc]init];
    toolbar.frame =  CGRectMake(0, LSIZE.height - 44, LSIZE.width, 44);
    toolbar.backgroundColor = [UIColor blackColor];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_news_share"] style:UIBarButtonItemStyleDone target:self action:@selector(itemButtonClick:)];
    UIBarButtonItem *leftItem2 = [[UIBarButtonItem alloc]initWithTitle:@"分享" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_news_keep_default"] style:UIBarButtonItemStyleDone target:self action:@selector(itemButtonClick:)];
    UIBarButtonItem *rightItem2 = [[UIBarButtonItem alloc]initWithTitle:@"收藏" style:UIBarButtonItemStyleDone target:nil action:nil];
    NSArray *arr = @[leftItem,leftItem2,rightItem,rightItem2];
    [toolbar setItems:arr animated:YES];
    [self.view addSubview:toolbar];
    
    
    
}
-(void)createBottomView{
    
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, LSIZE.height - 44, LSIZE.width, 44);
    
    UIButton *leftButton = [[UIButton alloc]init];
    leftButton.frame = CGRectMake(0, 0, LSIZE.width/2, 44);
    [leftButton addTarget:self action:@selector(itemButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *leftImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_news_share"]];
    leftImageV.frame = LRect(40, 0, 40, 40);
    UILabel *leftLabel = [[UILabel alloc]init];
    leftLabel.frame = LRect(80, 0, 40, 40);
    leftLabel.text = @"分享";
    [leftButton addSubview:leftLabel];
    [leftButton addSubview:leftImageV];
    [view addSubview:leftButton];
    
    
    
    UIButton *rightButton = [[UIButton alloc]init];
    rightButton.frame = CGRectMake(LSIZE.width/2, 0, LSIZE.width/2, 44);
    [rightButton addTarget:self action:@selector(itemButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    //    [rightButton set]
    UIImageView *rightImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_news_keep_default"]];
    rightImageV.frame = LRect(40, 0, 40, 40);
    UILabel *rightLabel = [[UILabel alloc]init];
    rightLabel.frame = LRect(80, 0, 40, 40);
    rightLabel.text = @"收藏";
    [rightButton addSubview:rightLabel];
    [rightButton addSubview:rightImageV];
    [view addSubview:rightButton];
    
    
    [self.view addSubview:view];
    
}

-(void)itemButtonClick:(UIBarButtonItem *)sender{
    NSLog(@"1111");
}
#pragma mark 网页进度条代理

-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress{
    [_webViewProgressView setProgress:progress animated:YES];
    self.title = [_webV stringByEvaluatingJavaScriptFromString:@"document.title"];
}
//网页相关代理
- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didFailLoadWithError:%@", error);
}
#pragma mark 进度条加载删除

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar addSubview:_webViewProgressView];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_webViewProgressView removeFromSuperview];
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
