//
//  CALayer+WGExtension.m
//  Emodor2C
//
//  Created by 伍健伟 on 2020/12/3.
//  Copyright © 2020 Emodor. All rights reserved.
//

#import "CALayer+WGExtension.h"

@implementation CALayer (WGExtension)

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
    
    self.wg_x = wg_centerX - self.wg_width / 2;
}
- (CGFloat)wg_centerX {
    
    return self.wg_x + self.wg_width / 2;
}

/**
 * 中心y坐标
 */
- (void)setWg_centerY:(CGFloat)wg_centerY {
    
    self.wg_y = wg_centerY - self.wg_height / 2;
}
- (CGFloat)wg_centerY {
    
    return self.wg_y + self.wg_height / 2;
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

@end
