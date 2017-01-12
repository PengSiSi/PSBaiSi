//
//  ItemModel.h
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/12.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject

/**
 android = "";
 icon = "http://img.spriteapp.cn/ugc/2015/05/20/150532_5078.png";
 id = 28;
 ipad = "";
 iphone = "";
 market = "";
 name = "审帖";
 url = "mod://BDJ_To_Check";
 */

@property (nonatomic, copy) NSString *android;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, copy) NSString *ipad;
@property (nonatomic, copy) NSString *iphone;
@property (nonatomic, copy) NSString *market;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;

@end
