//
//  UIView+ZWConfigBlank.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "UIView+ZWConfigBlank.h"

static char BlankPageViewKey;

@implementation UIView (ZWConfigBlank)

- (void)setBlankPageView:(ZWEasyBlankPageView *)blankPageView{
    objc_setAssociatedObject(self, &BlankPageViewKey,
                             blankPageView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ZWEasyBlankPageView *)blankPageView{
    return objc_getAssociatedObject(self, &BlankPageViewKey);
}

- (void)configBlankPage:(ZWEasyBlankPageViewType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block{
    if (hasData) {
        if (self.blankPageView) {
            self.blankPageView.hidden = YES;
            [self.blankPageView removeFromSuperview];
        }
    }else{
        if (!self.blankPageView) {
            self.blankPageView = [[ZWEasyBlankPageView alloc] initWithFrame:CGRectMake(0, 0, self.ZW_width, self.ZW_height)];
        }
        self.blankPageView.hidden = NO;
        [self addSubview:self.blankPageView];
        
        [self.blankPageView configWithType:blankPageType hasData:hasData hasError:hasError reloadButtonBlock:block];
    }
}

@end
