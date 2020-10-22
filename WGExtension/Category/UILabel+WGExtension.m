//
//  UILabel+WGExtension.m
//
//  Created by Veeco on 4/4/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import "UILabel+WGExtension.h"

@implementation UILabel (WGExtension)

/**
 * 平分内部单行文字间距
 * 参数 string 要设置的文字
 * 注意 要先设置了label宽度后再调用(本质是利用富文本属性) 暂时不支持英文字符
 */
- (void)wg_averageKernWithString:(nonnull NSString *)string {
    
    // 过滤
    if (![string isKindOfClass:[NSString class]] || !string) return;
    
    // 算出间距
    CGFloat margin = (self.bounds.size.width - self.font.pointSize * string.length) / (string.length - 1);
    
    // 设置富文本属性
    NSDictionary *attDic = @{NSKernAttributeName : @(margin)};
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSRange range = NSMakeRange(0, string.length - 1);
    
    [attStr addAttributes:attDic range:range];
    
    self.attributedText = attStr;
}

@end
