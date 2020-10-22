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

@end
