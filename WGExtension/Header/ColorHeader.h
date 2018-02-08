//
//  ColorHeader.h
//  PuChi
//
//  Created by Veeco on 2017/11/14.
//  Copyright © 2017年 Chance. All rights reserved.
//

#ifndef ColorHeader_h
#define ColorHeader_h

#import <UIKit/UIKit.h>

/**
 获取对应颜色

 @param rgb 16进制值 e.g. 0x123456
 @return 对应颜色
 */
static inline
UIColor * UIColorMakeFromRGB(int rgb)
{
    return [UIColor colorWithRed:(rgb & 0xFF0000 >> 16) / 255.0f green:(rgb & 0xFF00 >> 8) / 255.0f blue:(rgb & 0xFF) / 255.0f alpha:1];
}

/**
 获取对应颜色

 @param rgb 16进制值 e.g. 0x123456
 @param alpha 不透明度 e.g. 0.5f
 @return 对应颜色
 */
static inline
UIColor * UIColorMakeFromRGBA(int rgb, float alpha)
{
    return [UIColor colorWithRed:(rgb & 0xFF0000 >> 16) / 255.0f green:(rgb & 0xFF00 >> 8) / 255.0f blue:(rgb & 0xFF) / 255.0f alpha:alpha];
}

/**
 获取对应颜色

 @param red 10进制红色值 e.g. 123
 @param green 10进制绿色值 e.g. 123
 @param blue 10进制蓝色值 e.g. 123
 @param alpha 不透明度 e.g. 0.5f
 @return 对应颜色
 */
static inline
UIColor * UIColorMakeWithRGBA(int red, int green, int blue, float alpha)
{
    return [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:alpha];
}

// 颜色方案

#define COLOR_MAIN UIColorMakeWithRGBA(94, 184, 106, 1) // 主色
#define COLOR_BG UIColorMakeWithRGBA(230, 230, 230, 1) // 背景色

#endif /* ColorHeader_h */
