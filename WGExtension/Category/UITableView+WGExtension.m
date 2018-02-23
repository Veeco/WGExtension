//
//  UITableView+WGExtension.m
//  PuChi
//
//  Created by Veeco on 30/01/2018.
//  Copyright © 2018 Chance. All rights reserved.
//

#import "UITableView+WGExtension.h"

@implementation UITableView (WGExtension)

/**
 获取默认偏差值
 
 @return 默认偏差值
 */
- (CGPoint)wg_getDefaultContentOffset {
    
    CGFloat offsetY = 0;
    
    if (IOS_SINCE(11)) offsetY = -self.adjustedContentInset.top;
    
    else offsetY = -self.contentInset.top;
    
    return CGPointMake(0, offsetY);
}

@end
