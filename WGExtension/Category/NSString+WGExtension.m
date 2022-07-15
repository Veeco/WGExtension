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
    NSMutableString *selfStr = self.mutableCopy;
    if ([selfStr hasPrefix:path]) {
        [selfStr deleteCharactersInRange:NSMakeRange(0, path.length)];
    }
    NSString *filePath = [path stringByAppendingPathComponent:selfStr];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return filePath;
}

/**
 sha1加密
 
 @return 加密后的字符串
 */
- (nonnull NSString *)wg_sha1 {
    
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

/**
 判断 gif
 
 @return 是否为 gif
 */
- (BOOL)wg_isGif {
    
    return [self containsString:@".gif"] || [self containsString:@".GIF"];
}

/**
 获取字节数
 
 @return 字节数
 */
- (NSInteger)getBytes {
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* da = [self dataUsingEncoding:enc];
    
    return [da length];
}

/// 更换协议
/// @param scheme 协议
- (nullable NSURL *)changeUrlScheme:(nonnull NSString *)scheme {
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:[NSURL URLWithString:self] resolvingAgainstBaseURL:NO];
    components.scheme = scheme;
    return [components URL];
}

@end
