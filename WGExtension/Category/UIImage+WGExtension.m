//
//  UIImage+WGExtension.m
//
//  Created by Veeco on 5/28/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import "UIImage+WGExtension.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (WGExtension)

/**
 * 获取圆形图片
 * 参数 borderWidth 边框宽度
 * 参数 borderColor 边框颜色
 * 返回 圆形图片
 * 注意 边框宽度会在原图基础外围添加, 即如果传入 borderWidth 会导致返回图片宽高变大; 原图不为正方形时, 会以较长一边作为基准
 */
- (nonnull UIImage *)wg_getRoundImageWithBorderWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor {

    // 内圆图片宽高
    CGFloat innerImageWH = MAX(self.size.width, self.size.height);
    
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
    [self drawAtPoint:CGPointMake(border, border)];
    
    // 5. 获取图片
    UIImage *roundImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6. 关闭上下文
    UIGraphicsEndImageContext();
    
    return roundImage;
}

/**
 获取竖直长图缩放后的顶端部分图片
 
 @param width 缩放的目标宽度
 @param topHeight 缩放后顶端部分图片的高度
 @return 顶端部分图片
 */
- (nonnull UIImage *)wg_getTopImageWithWidth:(CGFloat)width topHeight:(CGFloat)topHeight {
    
    if (self.size.width > self.size.height) return self;
    
    UIGraphicsBeginImageContext(CGSizeMake(width, topHeight));
    CGFloat drawHeight = width * self.size.height / self.size.width;
    [self drawInRect:CGRectMake(0, 0, width, drawHeight)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/**
 高斯模糊
 
 @param value 模糊数值
 @return 模糊后图片
 */
- (nullable UIImage *)wg_blurWithValue:(CGFloat)value {
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:self.CGImage];
    
    // 设置filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:@(value) forKey: @"inputRadius"];
    
    // 模糊图片
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGFloat lwPadding = 0;
    CGImageRef outImage = [context createCGImage:result fromRect:CGRectMake(lwPadding, lwPadding, self.size.width - lwPadding * 2, self.size.height - lwPadding * 2)];
    UIImage *blurImage = [UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    
    return blurImage;
}

@end
