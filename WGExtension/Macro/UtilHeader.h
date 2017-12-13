//
//  UtilHeader.h
//  PuChi
//
//  Created by Veeco on 2017/11/14.
//  Copyright © 2017年 ChenXi. All rights reserved.
//

#ifndef UtilHeader_h
#define UtilHeader_h

// 打印
#ifdef DEBUG
#define LOG(FORMAT, ...) fprintf(stderr, "%s : %d\t%s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define LOG_FUNC NSLog(@"%s", __func__);
#else
#define LOG(...)
#define LOG_FUNC
#endif

// 窗口
#define KEY_WINDOW UIApplication.sharedApplication.keyWindow
#define SCREEN_WIDTH UIScreen.mainScreen.bounds.size.width
#define SCREEN_HEIGHT UIScreen.mainScreen.bounds.size.height

// 屏幕类型
#define SCREEN_4_0 (SCREEN_WIDTH == 320) // 320 * 568 -> 640 * 1136
#define SCREEN_4_7 (SCREEN_WIDTH == 375) // 375 * 667 -> 750 * 1334
#define SCREEN_5_5 (SCREEN_WIDTH == 414) // 414 * 736 -> 1242 * 2208 -> 1080 * 1920
#define SCREEN_5_8 (SCREEN_HEIGHT == 812) // 375 * 812 -> 1125 * 2436

// 系统版本
#define IOS_SINCE(VERSION) @available(iOS VERSION, *)

// 常用区域尺寸
#define STATUS_BAR_HEIGHT (SCREEN_5_8 ? 44 : 20) // 状态栏高度
#define NAV_BAR_HEIGHT (44 + STATUS_BAR_HEIGHT) // 导航栏高度(包含状态栏)
#define BOTTOM_SAFE_MARGIN (SCREEN_5_8 ? 34 : 0) // 底部安全间隙
#define TAB_BAR_HEIGHT (49 + BOTTOM_SAFE_MARGIN) // 标签栏高度(包含底部安全间隙)

// 获取对应比例的像素(参数 x 为 4.7屏 下的开发像素)
#define SCREEN_SCALE(VALUE) ((VALUE) / 375.0f * SCREEN_WIDTH)
#define SS(VALUE) SCREEN_SCALE(VALUE)

// 字体
#define FONT_SIZE(SIZE) [UIFont systemFontOfSize:SIZE]
#define BOLD_SIZE(SIZE) [UIFont boldSystemFontOfSize:SIZE]

// 系统
#define APP_BUILD NSBundle.mainBundle.infoDictionary[@"CFBundleVersion"] // 构建版本
#define APP_VERSION NSBundle.mainBundle.infoDictionary[@"CFBundleShortVersionString"] // 发布版本

// 弱指针
#define WEAK(OBJECT) __weak __typeof(OBJECT) WEAK##_##OBJECT = OBJECT;
#define STRONG(OBJECT) __strong __typeof(OBJECT) OBJECT = WEAK##_##OBJECT;

// 单例
#define SINGLETON(CLASS) \
static __kindof CLASS * kInstance; \
\
+ (__kindof CLASS *)shared { \
\
return [[self alloc] init]; \
} \
\
+ (__kindof CLASS *)allocWithZone:(struct _NSZone *)zone { \
\
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
kInstance = [super allocWithZone:zone]; \
}); \
return kInstance; \
}

// 默认初始化异常
#define INITEXC \
- (instancetype)init { \
    if (self = [super init]) { \
\
        [NSException raise:@"初始化异常" format:@"请使用自定义初始方法"]; \
    } \
    return self; \
}

#endif /* UtilHeader_h */
