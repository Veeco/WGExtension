//
//  UUIDHelper.h
//  PuChi
//
//  Created by Veeco on 2017/11/14.
//  Copyright © 2017年 Chance. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UUIDHelper : NSObject

/**
 获取伪UDID

 @return UUID
 */
+ (nonnull NSString *)getFakeUDID;

/**
 生成UUID
 
 @return UUID
 */
+ (nonnull NSString *)createUUID;

@end
