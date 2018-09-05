//
//  UIImageView+FitNet.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "UIImageView+FitNet.h"
#import <AFNetworking.h>

@implementation UIImageView (FitNet)


//typedef void(^SDWebImageDownloaderProgressBlock)(NSInteger receivedSize, NSInteger expectedSize);
//typedef void(^SDWebImageCompletionBlock)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL);
- (void)ZW_setImageWithURL:(NSURL *)originImageURL thumbnailImageURL:(NSURL *)thumbImageURL placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDExternalCompletionBlock)completedBlock
{
    //    AFNetworkReachabilityStatusUnknown          = -1,
    //    AFNetworkReachabilityStatusNotReachable     = 0,
    //    AFNetworkReachabilityStatusReachableViaWWAN = 1,
    //    AFNetworkReachabilityStatusReachableViaWiFi = 2,
    
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    
    [[SDWebImageManager sharedManager] diskImageExistsForURL:originImageURL completion:^(BOOL isInCache) {
        
        if (mgr.isReachableViaWiFi || isInCache) {
            [self sd_setImageWithURL:originImageURL placeholderImage:placeholder options:options progress:progressBlock completed:completedBlock];
        }else if (mgr.isReachableViaWWAN)
        {
            
            // 沙盒中去取, 让用户选择
            BOOL is3GOr4GNeedOriginal = YES;
            
            if (is3GOr4GNeedOriginal) {
                
                [self sd_setImageWithURL:originImageURL placeholderImage:placeholder options:options progress:progressBlock completed:completedBlock];
            }else
            {
                
                [self sd_setImageWithURL:thumbImageURL placeholderImage:placeholder options:options  progress:progressBlock completed:completedBlock];
                
            }
            
        }else
        {
            [self sd_setImageWithURL:thumbImageURL placeholderImage:placeholder options:options  progress:progressBlock completed:completedBlock];
            
        }
        
        
    }];
}

@end
