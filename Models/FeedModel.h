//
//  FeedModel.h
//  ApplePai
//
//  Created by bwfstu on 16/6/3.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface FeedModel : JSONModel

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *tail;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *background;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, assign) NSInteger item_id;

@property (nonatomic, copy) NSString *share_link;


@end
