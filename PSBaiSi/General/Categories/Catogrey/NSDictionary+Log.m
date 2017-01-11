//
//  NSDictionary+Log.m
//  PackageDemo
//
//  Created by 思 彭 on 17/1/5.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)

+ (void)load{
    
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(replaceDescriptionWithLocale:indent:)), class_getInstanceMethod([self class], @selector(descriptionWithLocale:indent:)));
}

- (NSString *)replaceDescriptionWithLocale:(id)locale indent:(NSUInteger)level {
    
    return [self stringByReplaceUnicode:[self replaceDescriptionWithLocale:locale indent:level]];
}

- (NSString *)stringByReplaceUnicode:(NSString *)string {
    
    NSMutableString *convertedString = [string mutableCopy];
    [convertedString replaceOccurrencesOfString:@"\\U" withString:@"\\u" options:0 range:NSMakeRange(0, convertedString.length)];
    CFStringRef transform = CFSTR("Any-Hex/Java");
    CFStringTransform((__bridge CFMutableStringRef)convertedString, NULL, transform, YES);
    return convertedString;
}

@end
