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
