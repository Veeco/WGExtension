//
//  UUIDHelper.m
//  PuChi
//
//  Created by Veeco on 2017/11/14.
//  Copyright © 2017年 Chance. All rights reserved.
//

#import "UUIDHelper.h"
#import "KeyChainStore.h"

// UUID Key
static NSString *const kUUIDKey = @"kUUIDKey";

@implementation UUIDHelper

/**
 获取UUID
 
 @return UUID
 */
+ (nonnull NSString *)getUUID {
    
    NSString *UUID = (NSString *)[KeyChainStore loadDataWithKey:kUUIDKey];
    
    if (!UUID) {
        
        // 生成一个UUID
        CFUUIDRef UUIDRef = CFUUIDCreate(kCFAllocatorDefault);
        UUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,UUIDRef));
        UUID = UUID.lowercaseString;
        
        [KeyChainStore saveData:UUID withKey:kUUIDKey];
    }
    return UUID;
}

@end
