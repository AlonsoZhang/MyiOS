//
//  ZWNavigationController.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWNavigationController.h"

@interface ZWNavigationController ()

/** 系统的右划返回功能的代理记录 */
@property (nonatomic, strong) id popGesDelegate;

@end

@implementation ZWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.hidden = YES;
    
    
    [self setupPOPGes];
}
/*
 #pragma mark - 全局侧滑代码------------BEGIN----
 - (void)getSystemGestureOfBack
 {
 记录系统的pop代理
 UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:NSSelectorFromString(@"handleNavigationTransition:")];
 
 [self.view addGestureRecognizer:panGes];
 
 panGes.delegate = self;
 
 禁止之前的手势
 self.interactivePopGestureRecognizer.enabled = NO;
 
 }
 
 
 - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
 {
 非根控制器才能触发
 return self.childViewControllers.count > 1;
 }
 #pragma mark - 全局侧滑代码------------END----
 */

- (void)setupPOPGes
{
    self.fd_viewControllerBasedNavigationBarAppearanceEnabled = NO;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}


//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//
//    if (self.childViewControllers.count != 0) {
//
//        viewController.hidesBottomBarWhenPushed = YES;
//    }
//
//    [super pushViewController:viewController animated:animated];
//}

//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    if (self.viewControllers.count > 0) {
//        //第二级则隐藏底部Tab
//        viewController.hidesBottomBarWhenPushed = YES;
//    }
//    [super pushViewController:viewController animated:animated];
//}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
