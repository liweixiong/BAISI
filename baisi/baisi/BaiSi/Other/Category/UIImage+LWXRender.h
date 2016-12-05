//
//  UIImage+LWXRender.h
//  baisi
//
//  Created by Mac on 16/12/5.
//  Copyright © 2016年 gzjbwm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LWXRender)
/**
 返回一张原始图片
 
 @param name 图片的名字
 @return 被渲染好的图片
 */
+(instancetype)imageNamedWithRenderName:(NSString*)name;

@end
