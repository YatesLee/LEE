//
//  LFirstTableViewCell.m
//  ApplePai
//
//  Created by bwfstu on 16/6/3.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "LFirstTableViewCell.h"
#import "LSuperViewController.h"
@implementation LFirstTableViewCell{
    UIImageView *_imageV;
    UILabel * _sourceLabel;
    UILabel *_titleLabel;
    UILabel *_tailLabel;
    UIImageView *_backImageV;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self customView];
    }
    return self;
}
-(void)customView{
    
    
    
    _backImageV = [[UIImageView alloc]init];
    _backImageV.image = [UIImage imageNamed:@"img_food_bg"];
    _backImageV.layer.cornerRadius = 5;
    _backImageV.clipsToBounds = YES;
    //  backImageV.layer.borderWidth = 1;
    //  backImageV.layer.borderColor = [[UIColor grayColor] CGColor];
    [self addSubview:_backImageV];
    
    _imageV = [[UIImageView alloc]init];
    _imageV.layer.cornerRadius = 5;
    _imageV.frame = LRect(10, 10, LSIZE.width - 20,180);
    _imageV.clipsToBounds = YES;
    [self addSubview:_imageV];
    
    
    _sourceLabel = [[UILabel alloc]init];
    _sourceLabel.frame = CGRectMake(30*LSCREENSCALE, 80*LSCREENSCALE, 100*LSCREENSCALE, 20*LSCREENSCALE);
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = LRect(-5, 5, 2, 10);
    label.backgroundColor = [UIColor redColor];
    [_sourceLabel addSubview:label];
    [self addSubview:_sourceLabel];
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.frame = LRect(30, 120, 270, 20);
    [self addSubview:_titleLabel];
    
    _tailLabel = [[UILabel alloc]init];
    _tailLabel.frame =LRect(30, 160, 270, 20);
    [self addSubview:_tailLabel];
    
    
}
-(void)setModel:(FeedModel *)model{
    
    
    _sourceLabel.text = model.source;
    _sourceLabel.textColor = [UIColor whiteColor];
    _sourceLabel.font = [UIFont systemFontOfSize:15];
    
    _titleLabel.text = model.title;
    _titleLabel.adjustsFontSizeToFitWidth = YES;
    _titleLabel.textColor = [UIColor whiteColor];
    
    
    _tailLabel.text = model.tail;
    _tailLabel.textColor = [UIColor whiteColor];
    _tailLabel.font = [UIFont systemFontOfSize:15];
    
    
    
    if (model.background.length) {
        [_imageV setImageWithURL:[NSURL URLWithString:model.background] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
    }else{
        
        
        _backImageV.frame = LRect(5,10 , LSIZE.width -10, 140);
        _sourceLabel.frame = CGRectMake(30*LSCREENSCALE, 20*LSCREENSCALE, 100*LSCREENSCALE, 20*LSCREENSCALE);
        _sourceLabel.textColor = [UIColor grayColor];
        
        _titleLabel.frame = LRect(30,60, 260, 20);
        _titleLabel.textColor = [UIColor blackColor];
        
        _tailLabel.frame = LRect(30, 100, 320, 20);
        _tailLabel.textColor = [UIColor grayColor];
        _imageV.image = nil;
        //
        
    }
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

@end
