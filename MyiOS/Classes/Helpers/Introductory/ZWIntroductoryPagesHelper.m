//
//  ZWIntroductoryPagesHelper.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWIntroductoryPagesHelper.h"
#import "ZWIntroductoryPagesView.h"

@interface ZWIntroductoryPagesHelper ()

@property (weak, nonatomic) UIWindow *curWindow;

@property (strong, nonatomic) ZWIntroductoryPagesView *curIntroductoryPagesView;

@end

@implementation ZWIntroductoryPagesHelper

+ (instancetype)shareInstance
{
    static ZWIntroductoryPagesHelper *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[ZWIntroductoryPagesHelper alloc] init];
    });
    
    return shareInstance;
}

+ (void)showIntroductoryPageView:(NSArray<NSString *> *)imageArray
{
    if (![ZWIntroductoryPagesHelper shareInstance].curIntroductoryPagesView) {
        [ZWIntroductoryPagesHelper shareInstance].curIntroductoryPagesView = [ZWIntroductoryPagesView pagesViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) images:imageArray];
    }
    
    [ZWIntroductoryPagesHelper shareInstance].curWindow = [UIApplication sharedApplication].keyWindow;
    [[ZWIntroductoryPagesHelper shareInstance].curWindow addSubview:[ZWIntroductoryPagesHelper shareInstance].curIntroductoryPagesView];
}

@end
