//
//  HTTPTool.m
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/12.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "HTTPTool.h"

#define TIMEOUTINTERVAL 70

@implementation HTTPTool

#pragma mark - GET

+ (void)getWithURL:(NSString *)url headers:(NSDictionary *)headers params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure {
    [self requestWithType:@"GET" url:url headers:headers params:params success:success failure:failure];
}

#pragma mark - POST
+ (void)postWithURL:(NSString *)url headers:(NSDictionary *)headers params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure {
    [self requestWithType:@"POST" url:url headers:headers params:params success:success failure:failure];
}

+ (void)requestWithType:(NSString *)type url:(NSString *)url headers:(NSDictionary *)headers params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer.timeoutInterval = TIMEOUTINTERVAL;
    //设置请求头
    if (headers != nil) {
        for (id httpHeaderField in headers.allKeys) {
            id value = headers[httpHeaderField];
            if ([httpHeaderField isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                [manager.requestSerializer setValue:(NSString *)value forHTTPHeaderField:(NSString *)httpHeaderField];
            }else{
                NSLog(@"Error, class of key/value in headerFieldValueDictionary should be NSString.");
            }
        }
    }
    
    if ([type isEqualToString:@"GET"]) {
        [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 请求成功的时候会调用这里的代码
            // 通知外面的block，请求成功了
            if (success) {
                id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
                success(json);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 请求失败的时候会调用这里的代码
            // 通知外面的block，请求失败了
            if (failure) {
                failure(error);
            }
        }];
    }else if ([type isEqualToString:@"POST"]){
        [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 请求成功的时候会调用这里的代码
            // 通知外面的block，请求成功了
            if (success) {
                id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
                success(json);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 请求失败的时候会调用这里的代码
            // 通知外面的block，请求失败了
            if (failure) {
                failure(error);
            }
        }];
    }
}

@end
