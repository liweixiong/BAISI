//
//  AFHTTPSessionManager+XMGManager.h
//  BuDeJie20
//
//  Created by xiaomage on 2016/12/6.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFHTTPSessionManager (LWXManager)

/**
 自己封装的网络请求管理者

 @return 设置了接收text/html数据格式的JSON数据
 */
+(instancetype)lwx_manager;


/**
 自己基于AFN的GET请求进行封装的GET方法

 */
- (NSURLSessionDataTask *)lwx_GET:(NSString *)URLString
                       parameters:(id)parameters
                         progress:(void (^)(NSProgress * ))downloadProgress
                          success:(void (^)(NSURLSessionDataTask * task, NSDictionary* responseObject))success
                          failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;

@end
