//
//  UITableView+WGExtension.h
//  PuChi
//
//  Created by Veeco on 30/01/2018.
//  Copyright © 2018 Chance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (WGExtension)

/**
 获取默认偏差值

 @return 默认偏差值
 */
- (CGPoint)wg_getDefaultContentOffset;

@end
