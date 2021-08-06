//
//  UITabBar+WGExtension.m
//  PuChi
//
//  Created by Veeco on 2018/5/27.
//  Copyright © 2018 Chance. All rights reserved.
//

#import "UITabBar+WGExtension.h"
#import "UIView+WGExtension.h"

@implementation UITabBar (WGExtension)

/**
 显示角标
 
 @param index tabBar下标
 @return 是否设置成功
 */
- (BOOL)wg_showBadgeOnItemIndex:(Byte)index text:(nonnull NSString *)text {
    
    if (index >= self.items.count || !text.length) {
        return NO;
    }
    if (text.length > 4) {
        text = @"...";
    }
    
    // 移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    BadgeView *badgeView = [BadgeView getBadgeViewWithContent:text];
    badgeView.tag = index + 1;
    
    // 确定小红点的位置
    CGRect tabFrame = self.frame;
    const float percentX = (index + 0.5f) / self.items.count;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = 2;
    badgeView.wg_origin = CGPointMake(x, y);
    [self addSubview:badgeView];
    
    return YES;
}

/**
 隐藏角标
 
 @param index tabBar下标
 @return 是否设置成功
 */
- (BOOL)wg_hideBadgeOnItemIndex:(Byte)index {
    
    if (index >= self.items.count) {
        return NO;
    }
    [self removeBadgeOnItemIndex:index];
    
    return YES;
}

/**
 移除小红点

 @param index tabBar下标
 */
- (void)removeBadgeOnItemIndex:(int)index{
    
    for (UIView *subView in self.subviews) {
        
        if (subView.tag == index + 1) {
            
            [subView removeFromSuperview];
        }
    }
}

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
    redView.backgroundColor = UIColor.redColor;
    
    UILabel *lb = [UILabel new];
    [redView addSubview:lb];
    lb.text = content;
    lb.font = [UIFont boldSystemFontOfSize:12];
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
