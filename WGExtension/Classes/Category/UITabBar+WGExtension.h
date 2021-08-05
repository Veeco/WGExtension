//
//  UITabBar+WGExtension.h
//  PuChi
//
//  Created by Veeco on 2018/5/27.
//  Copyright © 2018 Chance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+WGExtension.h"
#import "ColorHeader.h"
#import "UtilHeader.h"

@interface UITabBar (WGExtension)

/**
 显示角标
 
 @param index tabBar下标
 @param text 内容
 @return 是否设置成功
 */
- (BOOL)wg_showBadgeOnItemIndex:(Byte)index text:(nonnull NSString *)text;

/**
 隐藏角标

 @param index tabBar下标
 @return 是否设置成功
 */
- (BOOL)wg_hideBadgeOnItemIndex:(Byte)index;

@end

@interface BadgeView : UIView

/// 获取小红点
/// @param content 内容
+ (nonnull __kindof BadgeView *)getBadgeViewWithContent:(nonnull NSString *)content;

@end

@implementation BadgeView

/// 获取小红点
/// @param content 内容
+ (nonnull __kindof BadgeView *)getBadgeViewWithContent:(nonnull NSString *)content {
    
    // 新建小红点
    const CGFloat offset = 2;
    
    BadgeView *badgeView = [BadgeView new];
    badgeView.wg_height = 22;
    badgeView.layer.cornerRadius = badgeView.wg_height / 2;
    badgeView.backgroundColor = UIColor.whiteColor;
    
    UIView *redView = [UIView new];
    [badgeView addSubview:redView];
    redView.wg_height = badgeView.wg_height - offset;
    redView.wg_centerY = redView.superview.wg_height / 2;
    redView.layer.cornerRadius = redView.wg_height / 2;
    redView.backgroundColor = UIColorMakeFromRGB(0xFB3A39);
    
    UILabel *lb = [UILabel new];
    [redView addSubview:lb];
    lb.text = content;
    lb.font = UIFontBoldMake(12);
    lb.textColor = UIColor.whiteColor;
    [lb sizeToFit];
    lb.wg_centerY = lb.superview.wg_height / 2;
    lb.superview.wg_width = lb.wg_width + 4 * 2;
    if (lb.superview.wg_width < lb.superview.wg_height) {
        lb.superview.wg_width = lb.superview.wg_height;
    }
    lb.wg_centerX = lb.superview.wg_width / 2;
    
    lb.superview.superview.wg_width = lb.superview.wg_width + offset;
    lb.superview.wg_centerX = lb.superview.superview.wg_width / 2;
    
    return badgeView;
}

@end
