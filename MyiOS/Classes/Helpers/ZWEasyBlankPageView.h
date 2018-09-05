//
//  ZWEasyBlankPageView.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZWEasyBlankPageViewTypeNoData
} ZWEasyBlankPageViewType;

@interface ZWEasyBlankPageView : UIView

- (void)configWithType:(ZWEasyBlankPageViewType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void(^)(UIButton *sender))block;

@end

