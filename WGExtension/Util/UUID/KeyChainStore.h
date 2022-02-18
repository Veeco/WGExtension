//
//  KeyChainStore.h
//  PuChi
//
//  Created by Veeco on 17/11/14.
//  Copyright © 2017年 Chance. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainStore : NSObject

/**
 保存 keyChain

 @param data 要保存的数据
 @param key 保存数据的 key
 */
+ (void)saveData:(nonnull id)data withKey:(nonnull NSString *)key ;

/**
 读取 keyChain

 @param key 保存数据的 key
 @return 保存的数据
 */
+ (nullable id)loadDataWithKey:(nonnull NSString *)key;

/**
 清除 keyChain

 @param key 保存数据的 key
 */
+ (void)deleteDataWithKey:(nonnull NSString *)key;

@end
