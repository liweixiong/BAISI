//
//  UIBarButtonItem+XMGitem.m
//  BuDeJie20
//
//  Created by xiaomage on 2016/12/4.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "UIBarButtonItem+LWXitem.h"

@implementation UIBarButtonItem (LWXitem)
+(instancetype)barButtonitemWithImageName:(NSString*)name HightlightName:(NSString*)HightlightName target:(id)target action:(SEL)action{

    UIButton* gameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [gameBtn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [gameBtn setImage:[UIImage imageNamed:HightlightName] forState:UIControlStateHighlighted];
    [gameBtn sizeToFit];
    [gameBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //通过view包装以解决超出范围响应bug
    UIView* contentView = [[UIView alloc] initWithFrame:gameBtn.bounds];
    [contentView addSubview:gameBtn];
   return [[self alloc] initWithCustomView:contentView];

}
+(instancetype)barButtonitemWithImageName:(NSString*)name selectedName:(NSString*)selectedName target:(id)target action:(SEL)action{
    
    UIButton* gameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [gameBtn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [gameBtn setImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
    [gameBtn sizeToFit];
    [gameBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //通过view包装以解决超出范围响应bug
    UIView* contentView = [[UIView alloc] initWithFrame:gameBtn.bounds];
    [contentView addSubview:gameBtn];
    return [[self alloc] initWithCustomView:contentView];
    
}

@end
