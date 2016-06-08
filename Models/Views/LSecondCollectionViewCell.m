//
//  LSecondCollectionViewCell.m
//  ApplePai
//
//  Created by bwfstu on 16/6/7.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "LSecondCollectionViewCell.h"
#import "LSuperViewController.h"
@implementation LSecondCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel:(LSecondGroupMOdel *)model{
    
    [self.imageV setImageWithURL:[NSURL URLWithString:model.image_url] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.imageV.contentMode = UIViewContentModeScaleAspectFit;
    self.nameLabel.text = model.name;
}
@end
