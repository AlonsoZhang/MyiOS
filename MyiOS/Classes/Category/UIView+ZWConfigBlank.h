//
//  UIView+ZWConfigBlank.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWEasyBlankPageView.h"

@interface UIView (ZWConfigBlank)
- (void)configBlankPage:(ZWEasyBlankPageViewType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void(^)(id sender))block;
@end
