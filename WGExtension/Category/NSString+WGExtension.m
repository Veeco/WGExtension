//
//  NSString+WGExtension.m
//  PuChi
//
//  Created by Veeco on 13/02/2018.
//  Copyright © 2018 Chance. All rights reserved.
//

#import "NSString+WGExtension.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (WGExtension)

/**
 md5化
 
 @return md5化后的字符串
 */
- (nonnull NSString *)wg_md5 {
    
    const char *cStr = [self UTF8String];
    unsigned char buff[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), buff);
    
    NSMutableString *result = @"".mutableCopy;
    for (int i = 0; i < 16; i++) {
        
        [result appendFormat:@"%02x", buff[i]];
    }
    return result;
}

/**
 在Cache下创建自身同名文件夹
 
 @return 文件夹路径
 */
- (nonnull NSString *)wg_makeCacheDir {
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *filePath = [path stringByAppendingPathComponent:self];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return filePath;
}

@end
