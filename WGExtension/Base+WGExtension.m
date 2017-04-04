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


@implementation NSArray (WGExtension)

+ (void)load {
    {
        Method oriMethod = class_getInstanceMethod(NSClassFromString(@"__NSSingleObjectArrayI"), @selector(objectAtIndex:));
        Method excMethod = class_getInstanceMethod(NSClassFromString(@"__NSSingleObjectArrayI"), @selector(wgObjectAtIndex:));
        method_exchangeImplementations(oriMethod, excMethod);
    }
    {
        Method oriMethod = class_getInstanceMethod(NSClassFromString(@"__NSPlaceholderArray"), @selector(initWithObjects:count:));
        Method excMethod = class_getInstanceMethod(NSClassFromString(@"__NSPlaceholderArray"), @selector(wgInitWithObjects:count:));
        method_exchangeImplementations(oriMethod, excMethod);
    }
}

/**
 * 替换数组访问元素方法
 * 越界访问也不会报错 --> 返回nil
 */
- (id)wgObjectAtIndex:(NSUInteger)index {
    
    if (index >= self.count) return nil;
    
    return [self wgObjectAtIndex:index];
}

/**
 * 替换创建数组方法
 * 元素为nil时也不会报错 --> 替换为NSNull对象占位
 */
- (instancetype)wgInitWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt {

    id newObjects[cnt];

    for (NSInteger i = 0; i < cnt; i++) {

        newObjects[i] = objects[i];
        
        if (!objects[i]) {
            newObjects[i] = [NSNull null];
        }
    }
    return [self wgInitWithObjects:newObjects count:cnt];
}

@end


@implementation NSMutableArray (WGExtension)

+ (void)load {
    {
        Method oriMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndex:));
        Method excMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(wgObjectAtIndex:));
        method_exchangeImplementations(oriMethod, excMethod);
    }
    {
        Method oriMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(insertObject:atIndex:));
        Method excMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(wgInsertObject:atIndex:));
        method_exchangeImplementations(oriMethod, excMethod);
    }
}

/**
 * 替换数组访问元素方法
 * 越界访问也不会报错 --> 返回nil
 */
- (id)wgObjectAtIndex:(NSUInteger)index {
    
    if (index >= self.count) return nil;
    
    return [self wgObjectAtIndex:index];
}

/**
 * 替换插入元素方法
 * 插入下标越界及所插入元素为nil时也不会报错 --> 替换为数组长度及NSNull对象占位
 */
- (void)wgInsertObject:(id)anObject atIndex:(NSUInteger)index {
    
    if (index > self.count) {
    
        index = self.count;
    }
    
    if (!anObject) {
        
        anObject = [NSNull null];
    }
    [self wgInsertObject:anObject atIndex:index];
}

@end


@implementation NSDictionary (WGExtension)

+ (void)load {
    {
        Method oriMethod = class_getInstanceMethod(NSClassFromString(@"__NSPlaceholderDictionary"), @selector(initWithObjects:forKeys:count:));
        Method excMethod = class_getInstanceMethod(NSClassFromString(@"__NSPlaceholderDictionary"), @selector(wgInitWithObjects:forKeys:count:));
        method_exchangeImplementations(oriMethod, excMethod);
    }
}

/**
 * 替换创建字典方法
 * key或value为nil时也不会报错 --> 替换为NSNull对象占位
 */
- (instancetype)wgInitWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt {

    id newObjects[cnt];
    id newKeys[cnt];
    
    for (NSInteger i = 0; i < cnt; i++) {
        
        newObjects[i] = objects[i];
        newKeys[i] = keys[i];
        
        if (!objects[i]) {
            newObjects[i] = [NSNull null];
        }
        if (!keys[i]) {
            newKeys[i] = [NSNull null];
        }
    }
    return [self wgInitWithObjects:newObjects forKeys:newKeys count:cnt];
}

@end


@implementation NSMutableDictionary (WGExtension)

+ (void)load {

    {
        Method oriMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(removeObjectForKey:));
        Method excMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(wgRemoveObjectForKey:));
        method_exchangeImplementations(oriMethod, excMethod);
    }
}

/**
 * 替换删除key对应value方法
 * key为nil时也不会报错 --> 什么都不执行
 */
- (void)wgRemoveObjectForKey:(id)aKey {

    if (aKey) {
        
        [self wgRemoveObjectForKey:aKey];
    }
}

@end
