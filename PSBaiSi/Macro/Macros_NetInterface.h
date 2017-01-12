//
//  Macro_NetInterface.h
//  zichan
//
//  Created by Mike on 16/5/25.
//  Copyright © 2016年 Mike. All rights reserved.
//

#ifndef Macro_NetInterface_h
#define Macro_NetInterface_h

#define isNilOrNull(obj) (obj == nil || [obj isEqual:[NSNull null]])

#define setObjectForKey(object) \
do { \
    [dictionary setObject:object forKey:@#object]; \
} while (0)

#define setOptionalObjectForKey(object) \
do { \
    isNilOrNull(object) ?: [dictionary setObject:object forKey:@#object]; \
} while (0)

//// baseURL
#define ZC_BASE_URL ([NSString stringWithFormat:@"%@/services/V1", USERDEFAULT_OBJ4KEY(kServerURL)]) // http://192.168.50.143:8088 http://111.207.253.203:9085 http://192.168.130.74:8080  http://192.168.50.26:9085

// ----------------------------------------------------------------------------
#pragma mark - 1.登录
// 1.登录 --GET
#define MY_URL ([NSString stringWithFormat:@"http://api.budejie.com/api/api_open.php"])

// 参数构造
NS_INLINE NSDictionary *BSMyParameter(NSString *a, NSString *c) {
    return NSDictionaryOfVariableBindings(a, c);
}

#endif /* Macro_NetInterface_h */
