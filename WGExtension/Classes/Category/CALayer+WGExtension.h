//
//  CALayer+WGExtension.h
//  Emodor2C
//
//  Created by 伍健伟 on 2020/12/3.
//  Copyright © 2020 Emodor. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (WGExtension)

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

@end

NS_ASSUME_NONNULL_END
