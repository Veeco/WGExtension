#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "WGExtension.h"
#import "CALayer+WGExtension.h"
#import "NSArray+WGExtension.h"
#import "NSDictionary+WGExtension.h"
#import "NSObject+WGExtension.h"
#import "NSString+WGExtension.h"
#import "UICollectionView+WGExtension.h"
#import "UIImage+WGExtension.h"
#import "UILabel+WGExtension.h"
#import "UITabBar+WGExtension.h"
#import "UITableView+WGExtension.h"
#import "UITextField+WGExtension.h"
#import "UITextView+WGExtension.h"
#import "UIView+WGExtension.h"
#import "UIViewController+WGExtension.h"
#import "ColorHeader.h"
#import "UtilHeader.h"
#import "KeyChainStore.h"
#import "UUIDUtil.h"

FOUNDATION_EXPORT double WGExtensionVersionNumber;
FOUNDATION_EXPORT const unsigned char WGExtensionVersionString[];

