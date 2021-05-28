//
//  NSString+WGExtension.h
//  PuChi
//
//  Created by Veeco on 13/02/2018.
//  Copyright © 2018 Chance. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WGExtension)

/**
 自身md5化

 @return md5化后的字符串
 */
- (nonnull NSString *)wg_md5;

/**
 在Cache下创建自身同名文件夹
 
 @return 文件夹路径
 */
- (nonnull NSString *)wg_makeCacheDir;

/**
 sha1加密
 
 @return 加密后的字符串
 */
- (nonnull NSString *)wg_sha1;

/**
 判断 gif

 @return 是否为 gif
 */
- (BOOL)wg_isGif;

/**
 获取字节数

 @return 字节数
 */
- (NSInteger)getBytes;

@end
