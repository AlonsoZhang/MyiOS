//
//  ZWHomeViewController.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWHomeViewController.h"
#import "ZWWebViewController.h"
//#import "ZWLiftCycleViewController.h"
//#import "ZWRunTimeViewController.h"
//#import "ZWProtocolViewController.h"
//#import "ZWBlockLoopViewController.h"

@interface ZWHomeViewController ()

@end

@implementation ZWHomeViewController

#pragma mark viewController生命周期
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //关闭抽屉模式
    //    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    
    //设置打开抽屉模式
    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIEdgeInsets edgeInsets = self.tableView.contentInset;
    edgeInsets.bottom += self.tabBarController.tabBar.ZW_height;
    self.tableView.contentInset = edgeInsets;
    
//    ZWWordArrowItem *item00 = [ZWWordArrowItem itemWithTitle:@"ViewController的生命周期 :" subTitle: nil];
//    item00.destVc = [ZWLiftCycleViewController class];
//
//    ZWWordArrowItem *item01 = [ZWWordArrowItem itemWithTitle:@"运行时RunTime 的知识运用" subTitle: nil];
//    item01.destVc = [ZWRunTimeViewController class];
//
//    ZWWordArrowItem *item03 = [ZWWordArrowItem itemWithTitle:@"Protocol 的实现类(代理是如何实现的流程)" subTitle: nil];
//    item03.destVc = [ZWProtocolViewController class];
//
//
//    ZWWordArrowItem *item04 = [ZWWordArrowItem itemWithTitle:@"Block 内存释放" subTitle: nil];
//    item04.destVc = [ZWBlockLoopViewController class];
    
    
//    ZWItemSection *section0 = [ZWItemSection sectionWithItems:@[item00,item01,item03,item04] andHeaderTitle:@"生命周期, RunTime" footerTitle:nil];
    
//    [self.sections addObject:section0];
    
    
    
    //    ZWWordArrowItem *item10 = [ZWWordArrowItem itemWithTitle:@"NSThread 多线程" subTitle: nil];
    //    item10.destVc = [ZWNSThreadViewController class];
    
    //    ZWWordArrowItem *item11 = [ZWWordArrowItem itemWithTitle:@"GCD 多线程" subTitle: nil];
    //    item11.destVc = [ZWGCDViewController class];
    //
    //    ZWWordArrowItem *item12 = [ZWWordArrowItem itemWithTitle:@" NSOperation 多线程" subTitle: nil];
    //    item12.destVc = [ZWNSOperationViewController class];
    //
    //    ZWWordArrowItem *item13 = [ZWWordArrowItem itemWithTitle:@"同步锁知识" subTitle: nil];
    //    item13.destVc = [ZWLockViewController class];
    //
    //
    //
    //    ZWItemSection *section1 = [ZWItemSection sectionWithItems:@[item10] andHeaderTitle:@"NSThread, GCD, NSOperation, Lock" footerTitle:nil];
    //
    //    [section1.items makeObjectsPerformSelector:@selector(setTitleColor:) withObject:[UIColor RandomColor]];
    
    //    [self.sections addObject:section1];
    //
    //
    //    ZWWordArrowItem *item20 = [ZWWordArrowItem itemWithTitle:@"物理仿真" subTitle: @""];
    
    //    item20.destVc = [ZWDynamicViewController class];
    //
    //    ZWWordArrowItem *item21 = [ZWWordArrowItem itemWithTitle:@"核心动画" subTitle: @""];
    //
    //    item21.destVc = [ZWCoreAnimationViewController class];
    //
    //    ZWWordArrowItem *item22 = [ZWWordArrowItem itemWithTitle:@"绘图 Quartz2D" subTitle: @"Draw Rect"];
    //
    //    item22.destVc = [ZWDrawRectViewController class];
    //
    //    ZWItemSection *section2 = [ZWItemSection sectionWithItems:@[item20] andHeaderTitle:@"物理仿真, 核心动画, 绘图 Quartz2D" footerTitle:nil];
    //
    //    [self.sections addObject:section2];
    
    
    UITabBarItem *homeItem = self.navigationController.tabBarItem;
    
    [homeItem setBadgeValue:@"3"];
    
}


#pragma mark - ZWNavUIBaseViewControllerDataSource
//- (BOOL)navUIBaseViewControllerIsNeedNavBar:(ZWNavUIBaseViewController *)navUIBaseViewController
//{
//    return YES;
//}



#pragma mark - DataSource
/**头部标题*/
- (NSMutableAttributedString*)ZWNavigationBarTitle:(ZWNavigationBar *)navigationBar
{
    return [self changeTitle:@"基础"];
}

/** 背景图片 */
//- (UIImage *)ZWNavigationBarBackgroundImage:(ZWNavigationBar *)navigationBar
//{
//
//}

/** 背景色 */
//- (UIColor *)ZWNavigationBackgroundColor:(ZWNavigationBar *)navigationBar
//{
//
//}

/** 是否隐藏底部黑线 */
- (BOOL)ZWNavigationIsHideBottomLine:(ZWNavigationBar *)navigationBar
{
    return NO;
}

/** 导航条的高度 */
//- (CGFloat)ZWNavigationHeight:(ZWNavigationBar *)navigationBar
//{
//
//}


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
- (UIImage *)ZWNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(ZWNavigationBar *)navigationBar
{
    [leftButton setTitle:@"😁" forState:UIControlStateNormal];
    return nil;
}
/** 导航条右边的按钮 */
- (UIImage *)ZWNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(ZWNavigationBar *)navigationBar
{
    [rightButton setTitle:@"百度" forState:UIControlStateNormal];
    
    [rightButton setTitleColor:[UIColor RandomColor] forState:UIControlStateNormal];
    return nil;
}



#pragma mark - Delegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(ZWNavigationBar *)navigationBar
{
    NSLog(@"======");
}
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(ZWNavigationBar *)navigationBar
{
    ZWWebViewController *ac = [ZWWebViewController new];
    ac.gotoURL = @"http://www.baidu.com";
    
    [self.navigationController pushViewController:ac animated:YES];
    NSLog(@"%s", __func__);
}
/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(ZWNavigationBar *)navigationBar
{
    NSLog(@"%s", __func__);
}


#pragma mark 自定义代码

-(NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{   if(curTitle){
    
}
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle ?: @""];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, title.length)];
    
    return title;
}






@end
