//
//  UIView+WGExtension.m
//
//  Created by Veeco on 4/4/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import "UIView+WGExtension.h"

@implementation UIView (WGExtension)

/** 
 * 坐标
 */
- (void)setWg_origin:(CGPoint)wg_origin {

    CGRect frame = self.frame;
    frame.origin = wg_origin;
    self.frame = frame;
}
- (CGPoint)wg_origin {

    return self.frame.origin;
}

/**
 * x坐标
 */
- (void)setWg_x:(CGFloat)wg_x {
    
    CGRect frame = self.frame;
    frame.origin.x = wg_x;
    self.frame = frame;
}
- (CGFloat)wg_x {
    
    return self.frame.origin.x;
}

/**
 * y坐标
 */
- (void)setWg_y:(CGFloat)wg_y {
    
    CGRect frame = self.frame;
    frame.origin.y = wg_y;
    self.frame = frame;
}
- (CGFloat)wg_y {
    
    return self.frame.origin.y;
}

/**
 * 尺寸
 */
- (void)setWg_size:(CGSize)wg_size {
    
    CGRect frame = self.frame;
    frame.size = wg_size;
    self.frame = frame;
}
- (CGSize)wg_size {
    
    return self.frame.size;
}

/**
 * 宽度
 */
- (void)setWg_width:(CGFloat)wg_width {
    
    CGRect frame = self.frame;
    frame.size.width = wg_width;
    self.frame = frame;
}
- (CGFloat)wg_width {
    
    return self.frame.size.width;
}

/**
 * 高度
 */
- (void)setWg_height:(CGFloat)wg_height {
    
    CGRect frame = self.frame;
    frame.size.height = wg_height;
    self.frame = frame;
}
- (CGFloat)wg_height {
    
    return self.frame.size.height;
}

/**
 * 中心x坐标
 */
- (void)setWg_centerX:(CGFloat)wg_centerX {
    
    CGPoint center = self.center;
    center.x = wg_centerX;
    self.center = center;
}
- (CGFloat)wg_centerX {
    
    return self.center.x;
}

/**
 * 中心y坐标
 */
- (void)setWg_centerY:(CGFloat)wg_centerY {
    
    CGPoint center = self.center;
    center.y = wg_centerY;
    self.center = center;
}
- (CGFloat)wg_centerY {
    
    return self.center.y;
}

/** 
 * 顶端坐标(等同y坐标) 
 */
- (void)setWg_top:(CGFloat)wg_top {

    self.wg_y = wg_top;
}
- (CGFloat)wg_top {

    return self.wg_y;
}

/**
 * 左端坐标(等同x坐标)
 */
- (void)setWg_left:(CGFloat)wg_left {
    
    self.wg_x = wg_left;
}
- (CGFloat)wg_left {
    
    return self.wg_x;
}

/**
 * 底端坐标
 */
- (CGFloat)wg_bottom {
    
    return CGRectGetMaxY(self.frame);
}

/**
 * 右端坐标
 */
- (CGFloat)wg_right {

    return CGRectGetMaxX(self.frame);
}

/**
 * 安全间隙
 */
- (CGFloat)wg_safeTop {

    if (@available(iOS 11, *)) {
        
        return self.safeAreaInsets.top;
    }
    return 0;
}

- (CGFloat)wg_safeLeft {

    if (@available(iOS 11, *)) {
        
        return self.safeAreaInsets.left;
    }
    return 0;
}

- (CGFloat)wg_safeBottom {

    if (@available(iOS 11, *)) {
        
        return self.safeAreaInsets.bottom;
    }
    return 0;
}

- (CGFloat)wg_safeRight {

    if (@available(iOS 11, *)) {
        
        return self.safeAreaInsets.right;
    }
    return 0;
}

/**
 * 判断控件是否真正显示在主窗口
 * 返回 是否真正显示在主窗口
 */
- (BOOL)wg_isShowingOnKeyWindow {
    
    // 主窗口的bounds
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    CGRect winBounds = keyWindow.bounds;
    
    // 以主窗口左上角为坐标原点, 计算控件的frame
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    
    // 主窗口的bounds和控件的frame是否有重叠
    BOOL intersects = CGRectIntersectsRect(newFrame, winBounds);
    
    // 4大条件均满足即为真
    return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && intersects;
}

@end
