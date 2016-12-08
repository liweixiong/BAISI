//
//  AFHTTPSessionManager+XMGManager.m
//  BuDeJie20
//
//  Created by xiaomage on 2016/12/6.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "AFHTTPSessionManager+LWXManager.h"

@implementation AFHTTPSessionManager (LWXManager)
+(instancetype)lwx_manager{
    
    AFHTTPSessionManager* mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];

    return mgr;
}

- (NSURLSessionDataTask *)lwx_GET:(NSString *)URLString
                   parameters:(id)parameters
                     progress:(void (^)(NSProgress * _Nonnull))downloadProgress
                      success:(void (^)(NSURLSessionDataTask * _Nonnull task, NSDictionary* _Nullable responseObject))success
                      failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure
{
  return   [self GET:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
   
}

@end
