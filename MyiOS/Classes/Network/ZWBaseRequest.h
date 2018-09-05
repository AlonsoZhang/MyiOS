//
//  ZWBaseRequest.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ZWBaseResponse;

@interface ZWBaseRequest : NSObject


- (void)GET:(NSString *)URLString parameters:(id)parameters completion:(void(^)(ZWBaseResponse *response))completion;


- (void)POST:(NSString *)URLString parameters:(id)parameters completion:(void(^)(ZWBaseResponse *response))completion;


@end
