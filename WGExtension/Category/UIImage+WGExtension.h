//
//  UIImage+WGExtension.h
//
//  Created by Veeco on 5/28/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WGExtension)

/**
 * 获取圆形图片
 * 参数 borderWidth 边框宽度
 * 参数 borderColor 边框颜色
 * 返回 圆形图片
 * 注意 边框宽度会在原图基础外围添加, 即如果传入 borderWidth 会导致返回图片宽高变大; 原图不为正方形时, 会以较长一边作为基准
 */
- (nonnull UIImage *)wg_getRoundImageWithBorderWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor;

/**
 获取竖直长图缩放后的顶端部分图片

 @param width 缩放的目标宽度
 @param topHeight 缩放后顶端部分图片的高度
 @return 顶端部分图片
 */
- (nonnull UIImage *)wg_getTopImageWithWidth:(CGFloat)width topHeight:(CGFloat)topHeight;

@end
