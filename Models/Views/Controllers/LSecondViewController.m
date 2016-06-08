//
//  LSecondViewController.m
//  ApplePai
//
//  Created by bwfstu on 16/6/2.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "LSecondViewController.h"
#import "LSecondGroupMOdel.h"
#import "LSecondCollectionViewCell.h"
#import "LHeaderCollectionViewCell.h"
#import "LSecond2ViewController.h"
#define LHEDERID @"LHeaderCollectionViewCell"
@interface LSecondViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@end

@implementation LSecondViewController{
    UICollectionView *_collectionV;
    NSMutableArray *_groupArr;
    NSArray *_nameArr;
    NSMutableDictionary *_groupDict;
    int _section;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSourceArr = [NSMutableArray new];
    _groupArr = [NSMutableArray array];
    [self prepareData];
   
     [self createFoodVsView];
    
    
}
-(void)createFoodVsView{
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(0,64, LSIZE.width, 40*LSCREENSCALE);
    [self.view addSubview:button];
    
    UIImageView *LeftimageV = [[UIImageView alloc]init];
    LeftimageV.frame = LRect(10, 10, 20, 20);
    LeftimageV.image = [UIImage imageNamed:@"ic_food_vs"];
    [button addSubview:LeftimageV];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.frame = LRect(35, 5, 100, 20);
    titleLabel.text = @"食物对比";
    titleLabel.font = [UIFont systemFontOfSize:16];
    [button addSubview:titleLabel];
    
    UILabel *detailLabel = [[UILabel alloc]init];
    detailLabel.frame = LRect(35, 25, 100, 10);
    detailLabel.text = @"食物数据大PK";
    detailLabel.font = [UIFont systemFontOfSize:13];
    detailLabel.textColor = [UIColor grayColor];
    [button addSubview:detailLabel];
    
    UIImageView *rightImageV = [[UIImageView alloc]init];
    rightImageV.frame = LRect(290, 15, 10, 10);
    rightImageV.image = [UIImage imageNamed:@"ic_arrow_right_default"];
    [button addSubview:rightImageV];
    
    
}
-(void)prepareData{
    [self prepareDataGetUrlWithString:@"http://food.boohee.com/fb/v1/categories/list"];
    _nameArr = @[@"食物分类",@"热门品牌",@"连锁餐饮"];
}
#pragma mark - 准备数据
-(void)getDataSourceWithObject:(id)object{
    NSArray *arr = [(NSDictionary *)object objectForKey:@"group"];
    
    for (NSDictionary *dict in arr) {
        
        NSArray *categoriesArr = dict[@"categories"];
        NSArray *ModelArr = [LSecondGroupMOdel arrayOfModelsFromDictionaries:categoriesArr error:nil];
        [self.dataSourceArr  addObject:ModelArr];
        [_groupArr addObject:dict[@"kind"]];
    }
    [self createCollectionView];
}
-(void)createCollectionView{
    UICollectionViewFlowLayout *flowyout = [[UICollectionViewFlowLayout alloc]init];
    _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 104*LSCREENSCALE, LSIZE.width, LSIZE.height-153) collectionViewLayout:flowyout];
    _collectionV.backgroundColor = [UIColor whiteColor];
    _collectionV.delegate = self;
    _collectionV.dataSource = self;
    [self.view addSubview:_collectionV];
    
    [_collectionV registerNib:[UINib nibWithNibName:@"LSecondCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"LSecondCollectionViewCell"];
    
    
    [_collectionV registerNib:[UINib nibWithNibName:@"LHeaderCollectionViewCell" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:LHEDERID];
}
#pragma mark - collectionView delegate dataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _groupArr.count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
     NSArray *arr = self.dataSourceArr[section];
    return arr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LSecondCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LSecondCollectionViewCell" forIndexPath:indexPath];
    LSecondGroupMOdel *model = self.dataSourceArr[indexPath.section][indexPath.row];
    cell.model = model;
    return cell;
}


-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10*LSCREENSCALE;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10*LSCREENSCALE;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10*LSCREENSCALE, 10*LSCREENSCALE, 10*LSCREENSCALE, 10*LSCREENSCALE);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((LSIZE.width-40*LSCREENSCALE)/3.0-0.001, (LSIZE.width-40*LSCREENSCALE)/3.0-0.001);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(LSIZE.width, 51);
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSString *elementId;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        elementId = LHEDERID;
    }
       UICollectionReusableView *reuseableV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:elementId forIndexPath:indexPath];

    
    UILabel *label = (UILabel *)[reuseableV viewWithTag:1];
    label.text = _nameArr[indexPath.section];
    return reuseableV;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
     LSecond2ViewController *second2VC = [[LSecond2ViewController alloc]init];
     second2VC.hidesBottomBarWhenPushed = YES;
//    first2VC.link = model.link;
    [self.view.superview setTransitionAnimationType:CCXTransitionAnimationTypeOglFilp toward:CCXTransitionAnimationTowardFromRight duration:0.5];
    [self.navigationController pushViewController:second2VC animated:YES];
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
