//
//  UIView+WGExtension.h
//
//  Created by Veeco on 4/4/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WGExtension)

/** 坐标 */
@property (nonatomic, assign) CGPoint wg_origin;
/** x坐标 */
@property (nonatomic, assign) CGFloat wg_x;
/** y坐标 */
@property (nonatomic, assign) CGFloat wg_y;
/** 尺寸 */
@property (nonatomic, assign) CGSize wg_size;
/** 宽度 */
@property (nonatomic, assign) CGFloat wg_width;
/** 高度 */
@property (nonatomic, assign) CGFloat wg_height;
/** 中心x坐标 */
@property (nonatomic, assign) CGFloat wg_centerX;
/** 中心y坐标 */
@property (nonatomic, assign) CGFloat wg_centerY;
/** 顶端坐标(等同y坐标) */
@property (nonatomic, assign) CGFloat wg_top;
/** 左端坐标(等同x坐标) */
@property (nonatomic, assign) CGFloat wg_left;
/** 底端坐标 */
@property (nonatomic, assign, readonly) CGFloat wg_bottom;
/** 右端坐标 */
@property (nonatomic, assign, readonly) CGFloat wg_right;
/** 安全间隙 */
@property (nonatomic, assign, readonly) CGFloat wg_safeTop;
@property (nonatomic, assign, readonly) CGFloat wg_safeLeft;
@property (nonatomic, assign, readonly) CGFloat wg_safeBottom;
@property (nonatomic, assign, readonly) CGFloat wg_safeRight;
/**
 * 判断控件是否真正显示在主窗口
 * 返回 是否真正显示在主窗口
 */
@property (nonatomic, assign, readonly) BOOL wg_isShowingOnKeyWindow;

/** 设置可点击范围到按钮边缘的距离 */
- (void)wg_setEnlargeEdge:(CGFloat)size;

/** 设置可点击范围到按钮上、右、下、左的距离 */
- (void)wg_setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end
