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
- (void)setOrigin:(CGPoint)origin {

    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
- (CGPoint)origin {

    return self.frame.origin;
}

/**
 * x坐标
 */
- (void)setX:(CGFloat)x {
    
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)x {
    
    return self.frame.origin.x;
}

/**
 * y坐标
 */
- (void)setY:(CGFloat)y {
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)y {
    
    return self.frame.origin.y;
}

/**
 * 尺寸
 */
- (void)setSize:(CGSize)size {
    
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGSize)size {
    
    return self.frame.size;
}

/**
 * 宽度
 */
- (void)setWidth:(CGFloat)width {
    
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)width {
    
    return self.frame.size.width;
}

/**
 * 高度
 */
- (void)setHeight:(CGFloat)height {
    
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)height {
    
    return self.frame.size.height;
}

/**
 * 中心x坐标
 */
- (void)setCenterX:(CGFloat)centerX {
    
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerX {
    
    return self.center.x;
}

/**
 * 中心y坐标
 */
- (void)setCenterY:(CGFloat)centerY {
    
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (CGFloat)centerY {
    
    return self.center.y;
}

/**
 * 判断控件是否真正显示在主窗口
 * 返回 是否真正显示在主窗口
 */
- (BOOL)isShowingOnKeyWindow {
    
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
