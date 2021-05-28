//
//  UITextView+WGExtension.m
//  PuChi
//
//  Created by Veeco on 2018/5/27.
//  Copyright © 2018 Chance. All rights reserved.
//

#import "UITextView+WGExtension.h"

@implementation UITextView (WGExtension)

/**
 处理中文输入问题

 @param maxWordsCount 字数上限
 @return 是否有中文正在输入
 */
- (BOOL)wg_handleChineseWithMaxWordsCount:(NSInteger)maxWordsCount {
    
    // 1. 输入中的中文range
    UITextRange *range = nil;
    
    // 2. 获取当前输入法
    NSString *lang = self.textInputMode.primaryLanguage;
    
    // 3. 如果为中文则获取range
    if ([lang isEqualToString:@"zh-Hans"]) {
        
        range = [self markedTextRange];
    }
    
    // 4. 如果无正在输入的中文
    if (!range) {
        
        // 5. 限制最大输入数
        if (self.text.length > maxWordsCount) {
            
            self.text = [self.text substringToIndex:maxWordsCount];
        }
    }
    return range ? YES : NO;
}

@end
