//
//  NSString+WGExtension.h
//
//  Created by Veeco on 4/4/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (WGExtension)

/**
 * 计算出文字总体高度
 * 参数 width 文字总体宽度
 * 返回 文字总体高度
 * 注意 传入的宽度与字体大小要大于0且宽度不小于字体大小
 */
- (CGFloat)wg_calculateStringHeightWithWidth:(CGFloat)width fontSize:(CGFloat)fontSize;

@end
