//
//  XMGBackView.m
//  BuDeJie20
//
//  Created by xiaomage on 2016/12/4.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "LWXBackView.h"

@implementation LWXBackView

+(instancetype)backViewWithImageName:(NSString*)name HightlightName:(NSString*)HightlightName target:(id)target action:(SEL)action{

    UIButton* backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:HightlightName] forState:UIControlStateHighlighted];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted ];
    
    [backBtn sizeToFit];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //通过view包装以解决超出范围响应bug
   LWXBackView* backView =  [[LWXBackView alloc] initWithFrame:backBtn.bounds];
     [backView addSubview:backBtn];
    return backView;
}

@end
