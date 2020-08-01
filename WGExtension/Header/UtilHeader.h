//
//  UtilHeader.h
//  PuChi
//
//  Created by Veeco on 2017/11/14.
//  Copyright © 2017年 Chance. All rights reserved.
//

#ifndef UtilHeader_h
#define UtilHeader_h

// 打印
#ifdef DEBUG
#define LOG(FORMAT, ...) fprintf(stderr, "%s : %d\t%s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define LOG_FUNC LOG(@"%s", __func__)
#else
#define LOG(...)
#define LOG_FUNC
#endif

// 窗口
#define DELEGATE_WINDOW UIApplication.sharedApplication.delegate.window
#define SCREEN_WIDTH UIScreen.mainScreen.bounds.size.width
#define SCREEN_HEIGHT UIScreen.mainScreen.bounds.size.height

// 屏幕类型
// 320 * 480 -> 640 * 960
#define SCREEN_3_5 ((SCREEN_WIDTH == 320 && SCREEN_HEIGHT == 480) || (SCREEN_WIDTH == 480 && SCREEN_HEIGHT == 320))
// 320 * 568 -> 640 * 1136
#define SCREEN_4_0 ((SCREEN_WIDTH == 320 && SCREEN_HEIGHT == 568) || (SCREEN_WIDTH == 568 && SCREEN_HEIGHT == 320))
// 375 * 667 -> 750 * 1334
#define SCREEN_4_7 ((SCREEN_WIDTH == 375 && SCREEN_HEIGHT == 667) || (SCREEN_WIDTH == 667 && SCREEN_HEIGHT == 375))
// 414 * 736 -> 1242 * 2208 -> 1080 * 1920
#define SCREEN_5_5 ((SCREEN_WIDTH == 414 && SCREEN_HEIGHT == 736) || (SCREEN_WIDTH == 736 && SCREEN_HEIGHT == 414))
// 375 * 812 -> 1125 * 2436
#define SCREEN_5_8 ((SCREEN_WIDTH == 375 && SCREEN_HEIGHT == 812) || (SCREEN_WIDTH == 812 && SCREEN_HEIGHT == 375))
// 414 * 896 -> 828 * 1792
#define SCREEN_6_1 ((SCREEN_WIDTH == 414 && SCREEN_HEIGHT == 896) || (SCREEN_WIDTH == 896 && SCREEN_HEIGHT == 414))
// 414 * 896 -> 1242 * 2688
#define SCREEN_6_5 ((SCREEN_WIDTH == 414 && SCREEN_HEIGHT == 896) || (SCREEN_WIDTH == 896 && SCREEN_HEIGHT == 414))
// 留海屏
#define SCREEN_NEW (SCREEN_5_8 || SCREEN_6_1 || SCREEN_6_5)

#define PORTRAIT (SCREEN_WIDTH < SCREEN_HEIGHT) // 竖屏
#define LANDSCAPE (SCREEN_WIDTH > SCREEN_HEIGHT) // 横屏

// 系统版本
#define IOS_SINCE(VERSION) @available(iOS VERSION, *)

// 常用区域尺寸
#define STATUS_BAR_HEIGHT (PORTRAIT ? (SCREEN_NEW ? 44 : 20) : 0) // 状态栏高度
#define NAV_BAR_HEIGHT ((PORTRAIT ? 44 : 32) + STATUS_BAR_HEIGHT) // 导航栏高度(包含状态栏)
#define BOTTOM_SAFE_MARGIN (SCREEN_NEW ? (PORTRAIT ? 34 : 21) : 0) // 底部安全间隙
#define TAB_BAR_HEIGHT (45 + BOTTOM_SAFE_MARGIN) // 标签栏高度(包含底部安全间隙)

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
+ (__kindof CLASS *)sharedSingleton { \
 \
    return [[self alloc] init]; \
} \
 \
+ (__kindof CLASS *)allocWithZone:(struct _NSZone *)zone { \
 \
    static CLASS *kSharedSingleton; \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        kSharedSingleton = [super allocWithZone:zone]; \
    }); \
    return kSharedSingleton; \
} \
 \
- (id)copyWithZone:(NSZone *)zone { \
 \
    return self; \
} \
 \
- (id)mutableCopyWithZone:(NSZone *)zone { \
 \
    return self; \
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

// 自动提示宏
#define HINT_MACRO(OBJC, KEYPATH) @(((void)OBJC.KEYPATH, #KEYPATH))

#endif /* UtilHeader_h */
