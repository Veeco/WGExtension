//
//  UITableView+WGExtension.m
//  PuChi
//
//  Created by Veeco on 30/01/2018.
//  Copyright © 2018 Chance. All rights reserved.
//

#import "UITableView+WGExtension.h"
#import <objc/runtime.h>
#import "UIView+WGExtension.h"

static const char kVoidViewKey = '\0';

@implementation UITableView (WGExtension)

#pragma mark - <Getter & Setter>

- (UIView *)voidView {
    
    return objc_getAssociatedObject(self, &kVoidViewKey);
}

- (void)setVoidView:(UIView *)voidView {
    
    if (self.voidView) {
        
        [self.voidView removeFromSuperview];
    }
    if (voidView) {
        
        [self addSubview:voidView];
    }
    objc_setAssociatedObject(self, &kVoidViewKey, voidView, OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark - <System>

+ (void)load {
    
    Method oldM = class_getInstanceMethod(self, @selector(layoutSubviews));
    Method newM = class_getInstanceMethod(self, @selector(wg_layoutSubviews));
    method_exchangeImplementations(oldM, newM);
}

- (void)wg_layoutSubviews {
    
    self.voidView.center = CGPointMake(self.wg_width / 2, self.wg_height / 2);
    
    [self wg_layoutSubviews];
}

@end
