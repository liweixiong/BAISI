//
//  XMGNavBar.m
//  BuDeJie20
//
//  Created by xiaomage on 2016/12/4.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "LWXNavBar.h"
#import "LWXBackView.h"
#import "UIView+frame.h"
@implementation LWXNavBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)layoutSubviews{
    [super layoutSubviews];
    for (UIView* view in self.subviews ) {
                if ([view isKindOfClass:[LWXBackView class]]) {
                    view.xmg_x = 0;
                }
                
            }

    
}

@end
