//
//  NSDictionary+WGExtension.m
//
//  Created by Veeco on 4/17/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import "NSDictionary+WGExtension.h"

@implementation NSDictionary (WGExtension)

/**
 * 返回超级字典(字典中的所有子字典子数组子字符串均为可变对象)
 * 返回 超级字典
 */
- (nonnull NSMutableDictionary *)superCopy {

    return [self changeFromDictionary:self];
}

/**
 * 返回可变字典
 * 参数 dictionary 旧字典
 * 返回 可变字典
 */
- (nonnull NSMutableDictionary *)changeFromDictionary:(nonnull NSDictionary *)dictionary {

    // 创建可变字典
    NSMutableDictionary *dicM = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    
    // 遍历旧字典
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
    
        // 如果内有字典, 则进行递规并替换
        if ([obj isKindOfClass:[NSDictionary class]]) {
            
            NSString *keyStr = (NSString *)key;
            dicM[keyStr] = [self changeFromDictionary:obj];
        }
        // 如果内有数组, 则调用数组方法并替换
        else if ([obj isKindOfClass:[NSArray class]]) {
        
            NSArray *arr = (NSArray *)obj;
            NSString *keyStr = (NSString *)key;
            dicM[keyStr] = [self changeFromArray:arr];
        }
    }];
    
    // 遍历完成后返回
    return dicM;
}

/**
 * 返回可变数组
 * 参数 array 旧数组
 * 返回 可变数组
 */
- (nonnull NSMutableArray *)changeFromArray:(nonnull NSArray *)array {
    
    // 创建可变数组
    NSMutableArray *arrM = [NSMutableArray arrayWithArray:array];
    
    // 遍历数组
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 如果内有字典, 则调用字典方法并替换
        if ([obj isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *dic = (NSDictionary *)obj;
            arrM[idx] = [self changeFromDictionary:dic];
        }
        // 如果内有数组, 则进行递规并替换
        else if ([obj isKindOfClass:[NSArray class]]) {
            
            NSArray *arr = (NSArray *)obj;
            arrM[idx] = [self changeFromArray:arr];
        }
    }];
    
    // 遍历完成后返回
    return arrM;
}

@end
