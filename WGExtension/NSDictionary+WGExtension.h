//
//  NSDictionary+WGExtension.h
//
//  Created by Veeco on 4/17/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (WGExtension)

/**
 * 返回超级字典(字典中的所有子字典子数组子字符串均为可变对象)
 * 返回 超级字典
 */
- (nonnull NSMutableDictionary *)wg_superCopy;

@end
