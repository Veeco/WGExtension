//
//  NSArray+WGExtension.m
//
//  Created by Veeco on 4/18/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import "NSArray+WGExtension.h"

@implementation NSArray (WGExtension)

/**
 * 返回超级数组(数组中的所有子字典子数组子字符串均为可变对象)
 * 返回 超级数组
 */
- (nonnull NSMutableArray *)wg_superCopy {
    
    return [self changeFromArray:self];
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
        // 如果内有字符串, 则直接替换为可变字符串
        else if ([obj isKindOfClass:[NSString class]]) {
            
            NSString *str = (NSString *)obj;
            arrM[idx] = [NSMutableString stringWithString:str];
        }
    }];
    
    // 遍历完成后返回
    return arrM;
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
        // 如果内有字符串, 则直接替换为可变字符串
        else if ([obj isKindOfClass:[NSString class]]) {
            
            NSString *str = (NSString *)obj;
            dicM[key] = [NSMutableString stringWithString:str];
        }
    }];
    
    // 遍历完成后返回
    return dicM;
}

@end

@implementation NSMutableArray (WGExtension)

/**
 洗牌(乱序)
 */
- (void)shuffle {
    
    NSUInteger count = [self count];
    
    for (int i = 0; i < count; ++i) {
        
        int n = (arc4random() % (count - i)) + i;
        
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end
