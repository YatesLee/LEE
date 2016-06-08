//
//  LSecondCollectionViewCell.h
//  ApplePai
//
//  Created by bwfstu on 16/6/7.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSecondGroupMOdel.h"
@interface LSecondCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property(nonatomic,strong)LSecondGroupMOdel *model;
@end
