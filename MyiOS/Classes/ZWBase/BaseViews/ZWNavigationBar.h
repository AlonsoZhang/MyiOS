//
//  ZWNavigationBar.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ZWNavigationBar;
// 主要处理导航条
@protocol  ZWNavigationBarDataSource<NSObject>

@optional

/**头部标题*/
- (NSMutableAttributedString*)ZWNavigationBarTitle:(ZWNavigationBar *)navigationBar;

/** 背景图片 */
- (UIImage *)ZWNavigationBarBackgroundImage:(ZWNavigationBar *)navigationBar;
/** 背景色 */
- (UIColor *)ZWNavigationBackgroundColor:(ZWNavigationBar *)navigationBar;
/** 是否显示底部黑线 */
- (BOOL)ZWNavigationIsHideBottomLine:(ZWNavigationBar *)navigationBar;
/** 导航条的高度 */
- (CGFloat)ZWNavigationHeight:(ZWNavigationBar *)navigationBar;


/** 导航条的左边的 view */
- (UIView *)ZWNavigationBarLeftView:(ZWNavigationBar *)navigationBar;
/** 导航条右边的 view */
- (UIView *)ZWNavigationBarRightView:(ZWNavigationBar *)navigationBar;
/** 导航条中间的 View */
- (UIView *)ZWNavigationBarTitleView:(ZWNavigationBar *)navigationBar;
/** 导航条左边的按钮 */
- (UIImage *)ZWNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(ZWNavigationBar *)navigationBar;
/** 导航条右边的按钮 */
- (UIImage *)ZWNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(ZWNavigationBar *)navigationBar;
@end


@protocol ZWNavigationBarDelegate <NSObject>

@optional
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(ZWNavigationBar *)navigationBar;
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(ZWNavigationBar *)navigationBar;
/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(ZWNavigationBar *)navigationBar;
@end


@interface ZWNavigationBar : UIView

/** 底部的黑线 */
@property (weak, nonatomic) UIView *bottomBlackLineView;

/** <#digest#> */
@property (weak, nonatomic) UIView *titleView;

/** <#digest#> */
@property (weak, nonatomic) UIView *leftView;

/** <#digest#> */
@property (weak, nonatomic) UIView *rightView;

/** <#digest#> */
@property (nonatomic, copy) NSMutableAttributedString *title;

/** <#digest#> */
@property (weak, nonatomic) id<ZWNavigationBarDataSource> dataSource;

/** <#digest#> */
@property (weak, nonatomic) id<ZWNavigationBarDelegate> ZWDelegate;

/** <#digest#> */
@property (weak, nonatomic) UIImage *backgroundImage;

@end
