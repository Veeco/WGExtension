//
//  UUID.m
//  PuChi
//
//  Created by Veeco on 2017/11/14.
//  Copyright © 2017年 ChenXi. All rights reserved.
//

#import "UUID.h"
#import "KeyChainStore.h"

#define kUUIDKey @"kUUIDKey"

@implementation UUID

+ (NSString *)getUUID {
    
    NSString *UUID = (NSString *)[KeyChainStore loadDataWithKey:kUUIDKey];
    
    if (!UUID) {
        
        // 生成一个UUID
        CFUUIDRef UUIDRef = CFUUIDCreate(kCFAllocatorDefault);
        UUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,UUIDRef));
        
        [KeyChainStore saveData:UUID withKey:kUUIDKey];
    }
    return UUID;
}

@end
