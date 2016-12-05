//
//  UIImage+LWXRender.m
//  baisi
//
//  Created by Mac on 16/12/5.
//  Copyright © 2016年 gzjbwm. All rights reserved.
//

#import "UIImage+LWXRender.h"

/**
 图片分类的扩展
 */
@implementation UIImage (LWXRender)
+(instancetype)imageNamedWithRenderName:(NSString*)name{
    
    UIImage* image = [UIImage imageNamed:name];
    
    return  [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}
@end
