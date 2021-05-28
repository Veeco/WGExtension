//
//  UIViewController+WGExtension.m
//  Emodor2B
//
//  Created by Veeco on 2020/8/19.
//  Copyright © 2020 Emodor. All rights reserved.
//

#import "UIViewController+WGExtension.h"

@implementation UIViewController (WGExtension)

+ (void)load {
    
    Method old = class_getInstanceMethod(self, @selector(presentViewController:animated:completion:));
    Method new = class_getInstanceMethod(self, @selector(wg_presentViewController:animated:completion:));
    method_exchangeImplementations(old, new);
}

- (void)wg_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    
    if (!self.presentedViewController) {
        [self wg_presentViewController:viewControllerToPresent animated:flag completion:completion];
    }
}

@end
