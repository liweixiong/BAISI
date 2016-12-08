//
//  LWXSettingController.m
//  baisi
//
//  Created by Mac on 16/12/5.
//  Copyright © 2016年 gzjbwm. All rights reserved.
//

#import "LWXSettingController.h"
#import "UIView+frame.h"
#import "LWXNavBar.h"
#import "LWXBackView.h"

@interface LWXSettingController ()

@end

@implementation LWXSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    //1.设置contentView的frame
//    contentView.xmg_x = 0;
    //2.通过frame移动按钮的位置
//        backBtn.xmg_x = -15;
    //3.移动我们button的内容
//        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    //4.
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:contentView];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}


@end
