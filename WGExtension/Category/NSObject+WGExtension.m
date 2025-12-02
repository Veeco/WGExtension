//
//  NSObject+WGExtension.m
//  Test1
//
//  Created by Veeco on 2020/8/2.
//  Copyright © 2020 Chance. All rights reserved.
//

#import "NSObject+WGExtension.h"

@implementation NSObject (WGExtension)

- (NSDictionary *)wg_dictionary {
    
    NSDictionary *tSelf = (NSDictionary *)self;
    if ([tSelf isKindOfClass:NSDictionary.class] && tSelf.count) {
        return tSelf;
    }
    return nil;
}

- (NSArray *)wg_array {
    
    NSArray *tSelf = (NSArray *)self;
    if ([tSelf isKindOfClass:NSArray.class] && tSelf.count) {
        return tSelf;
    }
    return nil;
}

- (NSString *)wg_string {
    
    NSString *tSelf = (NSString *)self;
    if ([tSelf isKindOfClass:NSString.class] && tSelf.length) {
        return tSelf;
    }
    return nil;
}

- (NSNumber *)wg_number {
    
    NSNumber *tSelf = (NSNumber *)self;
    if ([tSelf isKindOfClass:NSNumber.class]) {
        return tSelf;
    }
    return nil;
}

@end
