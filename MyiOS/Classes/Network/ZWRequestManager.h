//
//  ZWRequestManager.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWBaseResponse.h"
#import <AFNetworking.h>

typedef enum : NSInteger {
    ZWRequestManagerStatusCodeCustomDemo = -10000,
} ZWRequestManagerStatusCode;

typedef ZWBaseResponse *(^ResponseFormat)(ZWBaseResponse *response);


@interface ZWRequestManager : AFHTTPSessionManager


+ (instancetype)sharedManager;


//本地数据模式
@property (assign, nonatomic) BOOL isLocal;

//预处理返回的数据
@property (copy, nonatomic) ResponseFormat responseFormat;


//当前的网络状态
@property (assign, nonatomic) AFNetworkReachabilityStatus currentNetworkStatus;



- (void)POST:(NSString *)urlString parameters:(id)parameters completion:(void (^)(ZWBaseResponse *response))completion;

- (void)GET:(NSString *)urlString parameters:(id)parameters completion:(void (^)(ZWBaseResponse *response))completion;

/**
 data 对应的二进制数据
 name 服务端需要参数
 */
- (void)upload:(NSString *)urlString parameters:(id)parameters formDataBlock:(void(^)(id<AFMultipartFormData> formData))formDataBlock progress:(void (^)(NSProgress *progress))progress completion:(void (^)(ZWBaseResponse *response))completion;


@end
