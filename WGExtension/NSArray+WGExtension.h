//
//  NSArray+WGExtension.h
//
//  Created by Veeco on 4/18/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (WGExtension)

/**
 * 返回超级数组(数组中的所有子字典子数组子字符串均为可变对象)
 * 参数 array 原数组
 * 返回 超级数组
 */
- (nonnull NSMutableArray *)superCopy;

@end
