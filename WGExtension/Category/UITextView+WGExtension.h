//
//  UITextView+WGExtension.h
//  PuChi
//
//  Created by Veeco on 2018/5/27.
//  Copyright © 2018 Chance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (WGExtension)

/**
 处理中文输入问题
 
 @param maxWordsCount 字数上限
 @return 是否有中文正在输入
 */
- (BOOL)wg_handleChineseWithMaxWordsCount:(NSInteger)maxWordsCount;

@end
