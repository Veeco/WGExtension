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
#define DLog(FORMAT, ...) fprintf(stderr, "%s : %d\t%s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define DLogFunc NSLog(@"%s", __func__);
#else
#define DLog(...)
#define DLogFunc
#endif

// 窗口
#define KeyWindow UIApplication.sharedApplication.keyWindow
#define ScreenWidth UIScreen.mainScreen.bounds.size.width
#define ScreenHeight UIScreen.mainScreen.bounds.size.height

// 屏幕类型
#define Screen4_0 (ScreenWidth == 320.0f) // 320 * 568 -> 640 * 1136
#define Screen4_7 (ScreenWidth == 375.0f) // 375 * 667 -> 750 * 1334
#define Screen5_5 (ScreenWidth == 414.0f) // 414 * 736 -> 1242 * 2208 -> 1080 * 1920
#define Screen5_8 (ScreenHeight == 812.0f) // 375 * 812 -> 1125 * 2436

// 系统版本
#define iOS_since(version) @available(iOS version, *)

// 常用区域尺寸
#define StatusBarHeight (Screen5_8 ? 44.0f : 20.0f) // 状态栏高度
#define NavBarHeight (44.0f + StatusBarHeight) // 导航栏高度(包含状态栏)
#define BottomSafeMargin (Screen5_8 ? 34.0f : 0.0f) // 底部安全间隙
#define TabBarHeight (49.0f + BottomSafeMargin) // 标签栏高度(包含底部安全间隙)

// 获取对应比例的像素(参数 x 为 4.7屏 下的开发像素)
#define ScreenScale(value) (value / 375.0f * ScreenWidth)
#define SS(value) ScreenScale(value)

// 字体
#define FontSize(size) [UIFont systemFontOfSize:size]
#define BoldSize(size) [UIFont boldSystemFontOfSize:size]

// 系统
#define AppBuild NSBundle.mainBundle.infoDictionary[@"CFBundleVersion"] // 构建版本
#define AppVersion NSBundle.mainBundle.infoDictionary[@"CFBundleShortVersionString"] // 发布版本

// 弱指针
#define weakify(object) __weak __typeof__(object) weak##_##object = object;
#define strongify(object) __strong __typeof__(object) object = weak##_##object;

// 单例
#define Singleton(Class) \
static Class *_instance; \
\
+ (Class *)shared { \
\
return [[self alloc] init]; \
} \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone { \
\
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
}

#endif /* UtilHeader_h */
