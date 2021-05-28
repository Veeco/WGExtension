//
//  UITabBar+WGExtension.h
//  PuChi
//
//  Created by Veeco on 2018/5/27.
//  Copyright © 2018 Chance. All rights reserved.
//

#import <UIKit/UIKit.h>

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
