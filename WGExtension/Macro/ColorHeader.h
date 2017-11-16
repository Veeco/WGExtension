//
//  ColorHeader.h
//  PuChi
//
//  Created by Veeco on 2017/11/14.
//  Copyright © 2017年 ChenXi. All rights reserved.
//

#ifndef ColorHeader_h
#define ColorHeader_h

// 颜色设定
#define COLOR_FROM_RGB(rgbValue) [UIColor colorWithRed:(rgbValue & 0xFF0000 >> 16) / 255.0f green:(rgbValue & 0xFF00 >> 8) / 255.0f blue:(rgbValue & 0xFF) / 255.0f alpha:1.0f] // RGB
#define COLOR_FROM_RGBA(rgbValue, alphaValue) [UIColor colorWithRed:(rgbValue & 0xFF0000 >> 16) / 255.0f green:(rgbValue & 0xFF00 >> 8) / 255.0f blue:(rgbValue & 0xFF) / 255.0f alpha:alphaValue / 1.0f] // RGBA
#define COLOR_WITH_RGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a / 1.0f] // RGBA

// 颜色方案
#define COLOR_MAIN COLOR_WITH_RGBA(94, 184, 106, 1) // 主色
#define COLOR_BG COLOR_WITH_RGBA(230, 230, 230, 1) // 主色

#endif /* ColorHeader_h */
