//
//  Base+WGExtension
//
//  Created by Veeco on 17/02/2017.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@implementation NSObject (WGExtension)

/**
 * 为基类增加访问数组元素方法
 * 即使不是数组对象调用也不会报错 --> 返回nil
 */
- (id)objectAtIndexedSubscript:(NSUInteger)index {
    
    return nil;
}

/**
 * 为基类增加访问字典value方法
 * 即使不是字典对象调用也不会报错 --> 返回nil
 */
- (id)objectForKeyedSubscript:(id)key {

    return nil;
}

@end
