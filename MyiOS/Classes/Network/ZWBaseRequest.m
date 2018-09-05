//
//  ZWBaseRequest.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWBaseRequest.h"

@implementation ZWBaseRequest


- (void)GET:(NSString *)URLString parameters:(id)parameters completion:(void(^)(ZWBaseResponse *response))completion
{
    
    ZWWeakSelf(self);
    [[ZWRequestManager sharedManager] GET:URLString parameters:parameters completion:^(ZWBaseResponse *response) {
        
        if (!weakself) {
            return ;
        }
        
        
        !completion ?: completion(response);
        
    }];
}

- (void)POST:(NSString *)URLString parameters:(id)parameters completion:(void(^)(ZWBaseResponse *response))completion
{
    ZWWeakSelf(self);
    [[ZWRequestManager sharedManager] POST:URLString parameters:parameters completion:^(ZWBaseResponse *response) {
        
        if (!weakself) {
            return ;
        }
        
        
        !completion ?: completion(response);
        
    }];
}



@end
