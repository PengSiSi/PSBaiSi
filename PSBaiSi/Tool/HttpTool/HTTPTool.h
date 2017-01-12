//
//  HTTPTool.h
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/12.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

/**
 *  请求成功后的回调
 *
 *  @param json 服务器返回的JSON数据
 */
typedef void (^HttpSuccess)(id json);
/**
 *  请求失败后的回调
 *
 *  @param error 错误信息
 */
typedef void (^HttpFailure)(NSError *error);


@interface HTTPTool : NSObject

/**
 *  发送一POST请求
 *
 *  @param url     请求路径
 *  @param headers 请求headers参数
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)postWithURL:(NSString *)url headers:(NSDictionary *)headers params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure;

/**
 *  发送一GET请求
 *
 *  @param url     请求路径
 *  @param headers 请求headers参数
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)getWithURL:(NSString *)url headers:(NSDictionary *)headers params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure;

@end
