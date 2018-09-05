//
//  ZWNavUIBaseViewController.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWNavUIBaseViewController.h"
#import "ZWNavigationBar.h"

@interface ZWNavUIBaseViewController ()



@end

@implementation ZWNavUIBaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}


#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.ZW_navgationBar.ZW_width = self.view.ZW_width;
    [self.view bringSubviewToFront:self.ZW_navgationBar];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = [self navUIBaseViewControllerPreferStatusBarStyle:self];
}


#pragma mark - ZWNavUIBaseViewControllerDataSource
- (BOOL)navUIBaseViewControllerIsNeedNavBar:(ZWNavUIBaseViewController *)navUIBaseViewController
{
    return YES;
}


- (UIStatusBarStyle)navUIBaseViewControllerPreferStatusBarStyle:(ZWNavUIBaseViewController *)navUIBaseViewController
{
    return UIStatusBarStyleDefault;
}


#pragma mark - DataSource
/**头部标题*/
- (NSMutableAttributedString*)ZWNavigationBarTitle:(ZWNavigationBar *)navigationBar
{
    return [self changeTitle:self.title ?: self.navigationItem.title];
}

/** 背景图片 */
//- (UIImage *)ZWNavigationBarBackgroundImage:(ZWNavigationBar *)navigationBar
//{
//
//}

/** 背景色 */
- (UIColor *)ZWNavigationBackgroundColor:(ZWNavigationBar *)navigationBar
{
    return [UIColor whiteColor];
}

/** 是否显示底部黑线 */
//- (BOOL)ZWNavigationIsHideBottomLine:(ZWNavigationBar *)navigationBar
//{
//    return NO;
//}

/** 导航条的高度 */
- (CGFloat)ZWNavigationHeight:(ZWNavigationBar *)navigationBar
{
    NSLog(@"%f",[UIApplication sharedApplication].statusBarFrame.size.height + 44.0);
    return [UIApplication sharedApplication].statusBarFrame.size.height + 44.0;
}


/** 导航条的左边的 view */
//- (UIView *)ZWNavigationBarLeftView:(ZWNavigationBar *)navigationBar
//{
//
//}
/** 导航条右边的 view */
//- (UIView *)ZWNavigationBarRightView:(ZWNavigationBar *)navigationBar
//{
//
//}
/** 导航条中间的 View */
//- (UIView *)ZWNavigationBarTitleView:(ZWNavigationBar *)navigationBar
//{
//
//}
/** 导航条左边的按钮 */
//- (UIImage *)ZWNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(ZWNavigationBar *)navigationBar
//{
//
//}
/** 导航条右边的按钮 */
//- (UIImage *)ZWNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(ZWNavigationBar *)navigationBar
//{
//
//}



#pragma mark - Delegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(ZWNavigationBar *)navigationBar
{
    NSLog(@"%s", __func__);
}
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(ZWNavigationBar *)navigationBar
{
    NSLog(@"%s", __func__);
}
/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(ZWNavigationBar *)navigationBar
{
    NSLog(@"%s", __func__);
}


#pragma mark 自定义代码

-(NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle ?: @""];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:18] range:NSMakeRange(0, title.length)];
    
    return title;
}


- (ZWNavigationBar *)ZW_navgationBar
{
    // 父类控制器必须是导航控制器
    if(!_ZW_navgationBar && [self.parentViewController isKindOfClass:[UINavigationController class]] && [self navUIBaseViewControllerIsNeedNavBar:self])
    {
        ZWNavigationBar *navigationBar = [[ZWNavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
        [self.view addSubview:navigationBar];
        _ZW_navgationBar = navigationBar;
        
        navigationBar.dataSource = self;
        navigationBar.ZWDelegate = self;
        
        
    }
    return _ZW_navgationBar;
}



-(void)changeNavigationBarTranslationY:(CGFloat)translationY
{
    self.ZW_navgationBar.transform = CGAffineTransformMakeTranslation(0, translationY);
}

-(void)changeNavgationTitle:(NSMutableAttributedString *)title
{
    self.ZW_navgationBar.title = title;
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    self.ZW_navgationBar.title = [self changeTitle:title];
}

-(void)changeNavigationBarHeight:(CGFloat)height
{
    self.ZW_navgationBar.ZW_height = height;
}

-(void)changeNavgationBarBackgroundColor:(UIColor *)backgroundColor
{
    self.ZW_navgationBar.backgroundColor = backgroundColor;
}
-(void)changeNavgationBarBackgroundView:(UIView *)view{
    
    self.ZW_navgationBar = (ZWNavigationBar*)view;
}

@end
