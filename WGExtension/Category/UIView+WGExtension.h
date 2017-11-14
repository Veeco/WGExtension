//
//  UIView+WGExtension.h
//
//  Created by Veeco on 4/4/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WGExtension)

/** 坐标 */
@property (nonatomic, assign) CGPoint origin;
/** x坐标 */
@property (nonatomic, assign) CGFloat x;
/** y坐标 */
@property (nonatomic, assign) CGFloat y;
/** 尺寸 */
@property (nonatomic, assign) CGSize size;
/** 宽度 */
@property (nonatomic, assign) CGFloat width;
/** 高度 */
@property (nonatomic, assign) CGFloat height;
/** 中心x坐标 */
@property (nonatomic, assign) CGFloat centerX;
/** 中心y坐标 */
@property (nonatomic, assign) CGFloat centerY;
/** 顶端坐标(等同y坐标) */
@property (nonatomic, assign) CGFloat top;
/** 左端坐标(等同x坐标) */
@property (nonatomic, assign) CGFloat left;
/** 底端坐标 */
@property (nonatomic, assign, readonly) CGFloat bottom;
/** 右端坐标 */
@property (nonatomic, assign, readonly) CGFloat right;

/**
 * 判断控件是否真正显示在主窗口
 * 返回 是否真正显示在主窗口
 */
- (BOOL)wg_isShowingOnKeyWindow;

@end
