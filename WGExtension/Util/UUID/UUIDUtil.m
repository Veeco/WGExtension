//
//  UUIDUtil.m
//  PuChi
//
//  Created by Veeco on 2017/11/14.
//  Copyright © 2017年 Chance. All rights reserved.
//

#import "UUIDUtil.h"
#import "KeyChainStore.h"

// UUID Key
static NSString *const kUUIDKey = @"kUUIDKey";

@implementation UUIDUtil

/**
 获取伪UDID

 @return UUID
 */
+ (nonnull NSString *)getFakeUDID {
    
    NSString *UUID = (NSString *)[KeyChainStore loadDataWithKey:kUUIDKey];
    
    if (!UUID) {
        
        UUID = [self createUUID];
        
        [KeyChainStore saveData:UUID withKey:kUUIDKey];
    }
    return UUID;
}

/**
 生成UUID
 
 @return UUID
 */
+ (nonnull NSString *)createUUID {
    
    // 生成一个UUID
    CFUUIDRef UUIDRef = CFUUIDCreate(kCFAllocatorDefault);
    NSString *UUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,UUIDRef));
    
    return UUID.lowercaseString;
}

@end
