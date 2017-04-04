//
//  NSString+WGExtension.h
//  test
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
 */
- (CGFloat)calculateStringHeightWithWidth:(CGFloat)width fontSize:(CGFloat)fontSize;

@end
