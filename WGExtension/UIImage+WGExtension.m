//
//  UIImage+WGExtension.m
//
//  Created by Veeco on 5/28/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import "UIImage+WGExtension.h"

@implementation UIImage (WGExtension)

/**
 * 生成圆形图片
 * 参数 image 原图
 * 参数 borderWidth 边框宽度
 * 参数 borderColor 边框颜色
 * 返回 圆形图片
 * 注意 边框宽度会在原图基础外围添加, 即如果传入 borderWidth 会导致返回图片宽高变大; 传入原图不为正方形时, 会以较长一边作为基准
 */
+ (nonnull UIImage *)imageRoundWithImage:(nonnull UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor {

    // 内圆图片宽高
    CGFloat innerImageWH = MAX(image.size.width, image.size.height);
    
    // 边框的宽度
    CGFloat border = borderWidth;
    
    // 外圆边框宽高
    CGFloat outterImageWH = innerImageWH + border * 2;
    
    // 1. 开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(outterImageWH, outterImageWH), NO, 0);
    
    // 2. 画外圆边框
    UIBezierPath *outterPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, outterImageWH, outterImageWH)];
    [borderColor set];
    [outterPath fill];
    
    // 3. 设置内圆图片裁剪区域
    UIBezierPath *innerPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, innerImageWH, innerImageWH)];
    [innerPath addClip];
    
    // 4. 绘制图片
    [image drawAtPoint:CGPointMake(border, border)];
    
    // 5. 获取图片
    UIImage *roundImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6. 关闭上下文
    UIGraphicsEndImageContext();
    
    return roundImage;
}

@end
