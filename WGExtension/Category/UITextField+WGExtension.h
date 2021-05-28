//
//  UITextField+WGExtension.h
//  PuChi
//
//  Created by Veeco on 2019/3/8.
//  Copyright © 2019 Chance. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (WGExtension)

/**
 处理中文输入问题
 
 @return 是否有中文正在输入
 */
- (BOOL)wg_handleChinese;

/**
 处理中文输入问题
 
 @param maxWordsCount 字数上限
 @return 是否有中文正在输入
 */
- (BOOL)wg_handleChineseWithMaxWordsCount:(NSInteger)maxWordsCount;
@end

NS_ASSUME_NONNULL_END
