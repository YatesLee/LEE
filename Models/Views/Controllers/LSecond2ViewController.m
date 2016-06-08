//
//  LSecond2ViewController.m
//  ApplePai
//
//  Created by bwfstu on 16/6/8.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "LSecond2ViewController.h"
#import "JSDropDownMenu.h"
#import "LFoodTypeModel.h"
@interface LSecond2ViewController ()<JSDropDownMenuDataSource,JSDropDownMenuDelegate>

@end

@implementation LSecond2ViewController{
    NSMutableArray *_dataArr;
    NSInteger _currentData1Index;
    NSInteger _currentData1SelectedIndex;
    JSDropDownMenu *_menu;

}

-(void)prepareTypeData{
    NSString *string = @"http://food.boohee.com/fb/v1/foods/sort_types";
    [self prepareDataGetUrlWithString:string];
}
-(void)getDataSourceWithObject:(id)object{
    self.dataSourceArr = [NSMutableArray new];
    _dataArr = [NSMutableArray new];
    NSArray *arr = [(NSDictionary *)object objectForKey:@"types"];
    [self.dataSourceArr addObjectsFromArray:[LFoodTypeModel arrayOfModelsFromDictionaries:arr error:nil]];
    for (LFoodTypeModel *model in self.dataSourceArr) {
        [_dataArr addObject:model.name];
    }
    [self createSortMemu];
}

-(void)createSortMemu{
    
    
    _currentData1Index = 1;
    _currentData1SelectedIndex = 1;
//    _dataArr = [[NSMutableArray alloc]initWithArray:@[@"1111",@"2222",@"3333",@"4444",@"5555",@"6666",@"7777",@"8888"]];
    _menu = [[JSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:40];
    _menu.indicatorColor = [UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1.0];
   
    _menu.separatorColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0];
    _menu.textColor = [UIColor colorWithRed:83.f/255.0f green:83.f/255.0f blue:83.f/255.0f alpha:1.0f];
    _menu.dataSource = self;
    _menu.delegate = self;
    
    [self.view addSubview:_menu];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self prepareTypeData];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu {
    
    return 1;
}

-(BOOL)displayByCollectionViewInColumn:(NSInteger)column{
    
    return YES;
        
    
}

-(BOOL)haveRightTableViewInColumn:(NSInteger)column{
    
    return NO;
}

-(CGFloat)widthRatioOfLeftColumn:(NSInteger)column{
    
   
    
    return 1;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column{
    
       return 0;
}

- (NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow{
    
    
        return _dataArr.count;
  
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column{
    
        return @"营养素排序";
           
    
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForRowAtIndexPath:(JSIndexPath *)indexPath {
    
    
        return _dataArr[indexPath.row];
    
}

- (void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath {
    
    
        _currentData1Index = indexPath.row;
   
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
