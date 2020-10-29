//
//  NSObject+WGExtension.h
//  Test1
//
//  Created by Veeco on 2020/8/2.
//  Copyright © 2020 Chance. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WGExtension)

/// 类型输出(类型不匹配或为空数据时返回 nil)
@property (nullable, nonatomic, strong, readonly) NSDictionary *wg_dictionary;
@property (nullable, nonatomic, strong, readonly) NSArray *wg_array;
@property (nullable, nonatomic, strong, readonly) NSString *wg_string;
@property (nullable, nonatomic, strong, readonly) NSNumber *wg_number;

@end

NS_ASSUME_NONNULL_END
