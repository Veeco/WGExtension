//
//  UILabel+WGExtension.h
//
//  Created by Veeco on 4/4/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WGExtension)

/**
 * 平分内部单行文字间距
 * 参数 string 要设置的文字
 * 注意 要先设置了label宽度后再调用(本质是利用富文本属性) 暂时不支持英文字符
 */
- (void)wg_averageKernWithString:(nonnull NSString *)string;

@end
