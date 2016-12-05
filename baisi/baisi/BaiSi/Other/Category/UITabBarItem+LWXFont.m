//
//  UITabBarItem+LWXFont.m
//  baisi
//
//  Created by Mac on 16/12/5.
//  Copyright © 2016年 gzjbwm. All rights reserved.
//

#import "UITabBarItem+LWXFont.h"

@implementation UITabBarItem (LWXFont)
-(void)setAttributesFont:(UIFont*)font{
    //创建属性字典
    NSMutableDictionary* attribu = [NSMutableDictionary dictionary];
    attribu[NSFontAttributeName] = font;
    //设置字体,字体不分状态,直接使用 UIControlStateNormal
    [self setTitleTextAttributes:attribu forState:UIControlStateNormal];
}
@end
