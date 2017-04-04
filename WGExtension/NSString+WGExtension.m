//
//  NSString+WGExtension.m
//
//  Created by Veeco on 4/4/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import "NSString+WGExtension.h"

@implementation NSString (WGExtension)

/**
 * 计算出文字总体高度
 * 参数 width 文字总体宽度
 * 返回 文字总体高度
 */
- (CGFloat)calculateStringHeightWithWidth:(CGFloat)width fontSize:(CGFloat)fontSize {

    // 设置属性
    NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    
    // 返回高度
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size.height;
}

@end
