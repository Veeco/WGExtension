//
//  ColorHeader.h
//  PuChi
//
//  Created by Veeco on 2017/11/14.
//  Copyright © 2017年 ChenXi. All rights reserved.
//

#ifndef ColorHeader_h
#define ColorHeader_h

// RGB
#define ColorFromRGB(rgbValue) [UIColor colorWithRed:(rgbValue & 0xFF0000 >> 16) / 255.0f green:(rgbValue & 0xFF00 >> 8) / 255.0f blue:(rgbValue & 0xFF) / 255.0f alpha:1.0f]
// RGBA
#define ColorFromRGBA(rgbValue, alphaValue) [UIColor colorWithRed:(rgbValue & 0xFF0000 >> 16) / 255.0f green:(rgbValue & 0xFF00 >> 8) / 255.0f blue:(rgbValue & 0xFF) / 255.0f alpha:alphaValue / 1.0f]
// RGBA
#define ColorWithRGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a / 1.0f]

#endif /* ColorHeader_h */
