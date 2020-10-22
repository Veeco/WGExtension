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

// 系统版本
#define IOS_SINCE(VERSION) @available(iOS VERSION, *)

/// 获取代理窗口
static inline
UIWindow * _Nonnull DELEGATE_WINDOW()
{
    return UIApplication.sharedApplication.delegate.window;
}

/// 获取屏宽
static inline
CGFloat SCREEN_WIDTH()
{
    return UIScreen.mainScreen.bounds.size.width;
}

/// 获取屏高
static inline
CGFloat SCREEN_HEIGHT()
{
    return UIScreen.mainScreen.bounds.size.height;
}

/// 判断是否留海屏
static inline
BOOL SCREEN_NEW()
{
    CGFloat big = MAX(SCREEN_WIDTH(), SCREEN_HEIGHT());
    CGFloat small = MIN(SCREEN_WIDTH(), SCREEN_HEIGHT());
    
    return (big / small) > 2;
}

/// 判断是否竖屏
static inline
BOOL PORTRAIT()
{
    return SCREEN_WIDTH() < SCREEN_HEIGHT();
}

/// 判断是否横屏
static inline
BOOL LANDSCAPE()
{
    return SCREEN_WIDTH() > SCREEN_HEIGHT();
}

/// 获取状态栏高度
static inline
CGFloat STATUS_BAR_HEIGHT() {
    
    return UIApplication.sharedApplication.statusBarFrame.size.height;
}

/// 获取与旧屏状态栏高度差
static inline
CGFloat STATUS_BAR_OFFSET()
{
    return PORTRAIT() ? STATUS_BAR_HEIGHT() - 20 : 0;
}

// 字体
static inline
UIFont * _Nonnull FONT_SIZE(SIZE)
{
    return [UIFont systemFontOfSize:SIZE];
}
static inline
UIFont * _Nonnull BOLD_SIZE(SIZE)
{
    return [UIFont boldSystemFontOfSize:SIZE];
}

/// 构建版本
static inline
NSString * _Nonnull APP_BUILD()
{
    return NSBundle.mainBundle.infoDictionary[@"CFBundleVersion"];
}

/// 发布版本
static inline
NSString * _Nonnull APP_VERSION()
{
    return NSBundle.mainBundle.infoDictionary[@"CFBundleShortVersionString"];
}

#endif /* UtilHeader_h */
