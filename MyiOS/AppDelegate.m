//
//  AppDelegate.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "AppDelegate.h"
#import "ZWTabBarController.h"
#import "ZWIntroductoryPagesHelper.h"
#import "AdvertiseHelper.h"
#import "YYFPSLabel.h"
#import "ZWGuidePushView.h"
#import "ZWLoginViewController.h"
#import "WJYAlertView.h"
//#import "ZWUMengHelper.h"
//#import "ZWUMeng.h"
#import <UserNotificationsUI/UserNotificationsUI.h>
#import <SMS_SDK/SMSSDK+ContactFriends.h>
#import "SYSafeCategory.h"
#import "CYLPlusButtonSubclass.h"
#import "CYLTabBarController.h"
//#import "SWRevealViewController.h"
//#import "LeftViewController.h"
//#import "BaseAnimationController.h"
//#import "RightViewController.h"
//#import "Definition.h"
//#import "YFMarqueeViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate,CYLTabBarControllerDelegate>
@property(nonatomic, strong)BMKMapManager* mapManager;
@property(nonatomic,strong) MMDrawerController * drawerController;
@property(nonatomic, strong)CYLTabBarController *tabBarController;

@end

@implementation AppDelegate

- (UIWindow *)window
{
    if(!_window)
    {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}
- (void)onGetNetworkState:(int)iError
{
    if (0 == iError) {
        NSLog(@"联网成功");
    }
    else{
        NSLog(@"onGetNetworkState %d",iError);
    }
    
}

- (void)onGetPermissionState:(int)iError
{
    if (0 == iError) {
        NSLog(@"授权成功");
    }
    else {
        NSLog(@"onGetPermissionState %d",iError);
    }
}

- (void)onCheckPermissionState:(BMKLocationAuthErrorCode)iError
{
    NSLog(@"location auth onGetPermissionState %ld",(long)iError);
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //[self map];
    
    [self setupLoginViewController];
    if (![GVUserDefaults standardUserDefaults].isLanuchedApp) {
        // 欢迎视图
        [ZWIntroductoryPagesHelper showIntroductoryPageView:@[@"intro_0.jpg", @"intro_1.jpg", @"intro_2.jpg", @"intro_3.jpg"]];
    }
    
    NSArray <NSString *> *imagesURLS = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495189872684&di=03f9df0b71bb536223236235515cf227&imgtype=0&src=http%3A%2F%2Fatt1.dzwww.com%2Fforum%2F201405%2F29%2F1033545qqmieznviecgdmm.gif", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495189851096&di=224fad7f17468c2cc080221dd78a4abf&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201505%2F12%2F20150512124019_GPjEJ.gif"];
    // 启动广告
    [AdvertiseHelper showAdvertiserView:imagesURLS];
    
    //iOS查看屏幕帧数工具   刷新率
    [self.window addSubview:[[YYFPSLabel alloc] initWithFrame:CGRectMake(20, 70, 0, 0)]];
    
    return YES;
}

//登录页面
-(void)setupLoginViewController{
    [CYLPlusButtonSubclass registerPlusButton];
    ZWLoginViewController *login = [[ZWLoginViewController alloc]init];
    self.window.rootViewController = login;
    [self.window makeKeyAndVisible];
}

//进入主页
-(void)setUpHomeViewController{
    //左侧菜单栏
//    LeftViewController *leftViewController = [[LeftViewController alloc] init];
//    ZWNavigationController *lefNav = [[ZWNavigationController alloc]initWithRootViewController:leftViewController];
//    //右侧菜单栏
//    RightViewController *rightViewController = [[RightViewController alloc] init];
//    ZWNavigationController *rigNav = [[ZWNavigationController alloc]initWithRootViewController:rightViewController];

    //    // 设置主窗口,并设置根控制器
    //    [CYLPlusButtonSubclass registerPlusButton];
    //    ZWTabBarController *tabBarControllerConfig = [[ZWTabBarController alloc] init];
    //    CYLTabBarController *tabBarController = tabBarControllerConfig.tabBarController;
    //放在代理下面 不会有tabbar标记    这个要放开self.window.rootViewController = tabBarController; //这种可以实现tabbar 按钮的动画
    //    ZWNavigationController *nav = [[ZWNavigationController alloc]initWithRootViewController:_tabBarController];
    
    ZWTabBarController *tabBarControllerConfig = [[ZWTabBarController alloc] init];
    _tabBarController = tabBarControllerConfig.tabBarController;
    _tabBarController.delegate = self;
    self.nav = [[ZWNavigationController alloc]initWithRootViewController:_tabBarController];
    
    
    //SWRevealViewController 这是一种侧滑
    //    [self swRevealViewController:leftViewController right:rightViewController tabbar:tabBarController];
    
    //MMDrawerController  这是一种侧滑
    [self mmDrawerController:nil right:nil tabbar:_tabBarController navController:self.nav];
    [self.window addSubview:[[YYFPSLabel alloc] initWithFrame:CGRectMake(20, 70, 0, 0)]];
    
    
    
    
    //   =======================================================================
    // 检查更新
    //    [[ZWRequestManager sharedManager] GET:[ZWShunJianBaseUrl stringByAppendingPathComponent:@"jsons/updateapp.json"] parameters:nil completion:^(ZWBaseResponse *response) {
    //        [self checkVersion:response];
    //    }];
}

//MMDrawerController  这是一种侧滑
-(void)mmDrawerController:(UIViewController*)leftViewController right:(UIViewController*)rightViewController tabbar:(CYLTabBarController*)tabBarController navController:(ZWNavigationController*)nav{
    self.drawerController =[[MMDrawerController alloc]initWithCenterViewController:nav leftDrawerViewController:leftViewController rightDrawerViewController:rightViewController];
    //4、设置打开/关闭抽屉的手势
    self.drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.drawerController.closeDrawerGestureModeMask =MMCloseDrawerGestureModeAll;
    //5、设置左边抽屉显示的多少
    self.drawerController.maximumLeftDrawerWidth = 320.0;
    //    self.drawerController.maximumRightDrawerWidth = 80;
    [self.drawerController setShowsShadow:YES];
    
    //    self.window.rootViewController = tabBarController; //这种可以实现tabbar 按钮的动画
    self.window.rootViewController = self.drawerController;
    
    [self.window makeKeyAndVisible];
    
    [self customizeInterfaceWithTabBarController:tabBarController];
    
}

- (void)customizeInterfaceWithTabBarController:(CYLTabBarController *)tabBarController {
    
    [tabBarController hideTabBadgeBackgroundSeparator];
    
    //添加小红点
    UIViewController *viewController = tabBarController.viewControllers[0];
    ZWLog(@"tabBarController = %@",viewController.tabBarItem);
    ZWLog(@"tabBarController == %@",viewController.tabBarItem.cyl_tabButton);
    UIView *tabBadgePointView0 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
    [viewController.tabBarItem.cyl_tabButton cyl_setTabBadgePointView:tabBadgePointView0];
    [viewController cyl_showTabBadgePoint];
    
    UIView *tabBadgePointView1 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
    @try {
        [tabBarController.viewControllers[1] cyl_setTabBadgePointView:tabBadgePointView1];
        [tabBarController.viewControllers[1] cyl_showTabBadgePoint];
        
        UIView *tabBadgePointView2 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
        [tabBarController.viewControllers[2] cyl_setTabBadgePointView:tabBadgePointView2];
        [tabBarController.viewControllers[2] cyl_showTabBadgePoint];
        
        [tabBarController.viewControllers[3] cyl_showTabBadgePoint];
        
        //添加提示动画，引导用户点击
        [self addScaleAnimationOnView:tabBarController.viewControllers[3].cyl_tabButton.cyl_tabImageView repeatCount:20];
    } @catch (NSException *exception) {}
}

#pragma mark - 缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount {
    //需要实现的帧动画，这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 1;
    animation.repeatCount = repeatCount;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
