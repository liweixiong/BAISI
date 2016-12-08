//
//  UIBarButtonItem+XMGitem.h
//  BuDeJie20
//
//  Created by xiaomage on 2016/12/4.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LWXitem)

/**
 封装一个有高亮状态的UIBarButtonItem

 @param name 普通状态的图片
 @param HightlightName 高亮状态图片
 @param target 响应者
 @param action 响应方法
 @return UIBar 实例
 */
+(instancetype)barButtonitemWithImageName:(NSString*)name HightlightName:(NSString*)HightlightName target:(id)target action:(SEL)action;

/**
 封装一个有高亮状态的UIBarButtonItem
 
 @param name 普通状态的图片
 @param selectedName 选中状态图片
 @param target 响应者
 @param action 响应方法
 @return UIBar 实例
 */

+(instancetype)barButtonitemWithImageName:(NSString*)name selectedName:(NSString*)selectedName target:(id)target action:(SEL)action;
@end
