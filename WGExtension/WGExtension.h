//
//  WGExtension.h
//
//  Created by Veeco on 4/4/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

// 说明:
// 1. 在导入 WGExtension.h 前导入全局宏 WG_SHORTHAND 可省略掉wg_前缀更为方便地调用属性, 但系统本来的同名属性将不能使用.

#import "UIView+WGExtension.h"
#import "NSString+WGExtension.h"
#import "UILabel+WGExtension.h"

#ifdef WG_SHORTHAND

#define origin wg_origin
#define x wg_x
#define y wg_y
#define size wg_size
#define width wg_width
#define height wg_height
#define centerX wg_centerX
#define centerY wg_centerY
#define top wg_top
#define left wg_left
#define bottom wg_bottom
#define right wg_right

#endif
