//
//  ZWNavUIBaseViewController.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWNavigationBar.h"
#import "ZWNavigationController.h"

@class ZWNavUIBaseViewController;
@protocol ZWNavUIBaseViewControllerDataSource <NSObject>

@optional
- (BOOL)navUIBaseViewControllerIsNeedNavBar:(ZWNavUIBaseViewController *)navUIBaseViewController;

- (UIStatusBarStyle)navUIBaseViewControllerPreferStatusBarStyle:(ZWNavUIBaseViewController *)navUIBaseViewController;

@end

@interface ZWNavUIBaseViewController : UIViewController <ZWNavigationBarDelegate, ZWNavigationBarDataSource,ZWNavUIBaseViewControllerDataSource>

-(void)changeNavigationBarTranslationY:(CGFloat)translationY;

-(void)changeNavgationTitle:(NSMutableAttributedString *)title;

-(void)changeNavigationBarHeight:(CGFloat)height;

-(void)changeNavgationBarBackgroundColor:(UIColor *)backgroundColor;
-(void)changeNavgationBarBackgroundView:(UIView *)view;
/** <#digest#> */
@property (weak, nonatomic) ZWNavigationBar *ZW_navgationBar;
@end
