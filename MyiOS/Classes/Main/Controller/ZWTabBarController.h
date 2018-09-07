//
//  ZWTabBarController.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CYLTabBarController.h>

@interface ZWTabBarController : NSObject

@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;
@property (nonatomic, copy) NSString *context;

@end
