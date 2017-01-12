//
//  ItemModel.m
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/12.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    
    return @{@"itemId": @"id"};
}
@end
