//
//  LWXMineViewController.m
//  baisi
//
//  Created by Mac on 16/12/5.
//  Copyright © 2016年 gzjbwm. All rights reserved.
//

#import "LWXMineViewController.h"
#import "UIBarButtonItem+LWXitem.h"
#import "LWXSettingController.h"
@interface LWXMineViewController ()

@end

@implementation LWXMineViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
}
-(void)setUpNav{
    
    //titleView
    self.navigationItem.title = @"我的";
    
    //左侧按钮
    //夜间按钮
    UIBarButtonItem*nightBtn   = [UIBarButtonItem barButtonitemWithImageName:@"mine-moon-icon" selectedName:@"mine-moon-icon-click" target:self action:@selector(nightBtnClick:)];
    //设置按钮
    UIBarButtonItem*settingBtn   = [UIBarButtonItem barButtonitemWithImageName:@"mine-setting-icon" HightlightName:@"mine-setting-icon-click" target:self action:@selector(settingBtnClick)];
    self.navigationItem.rightBarButtonItems = @[settingBtn,nightBtn];
}
//设置按钮被点击
-(void)settingBtnClick{
    
    LWXSettingController*settingVC =  [[LWXSettingController alloc] init];
    //    UIViewController*settingVC =  [[UIViewController alloc] init];//如果不设置view的颜色,会黑屏,并卡一下
    //    self.navigationController.navigationItem.backBarButtonItem =[UIBarButtonItem alloc] initWithCustomView:<#(nonnull UIView *)#>
//    settingVC.hidesBottomBarWhenPushed = YES;
  //  [self.navigationController pushViewController:settingVC animated:YES];
    // 自定义返回按钮
    //方案有几个?
    [self.navigationController pushViewController:settingVC animated:YES];

}
//夜间模式按钮被点击
-(void)nightBtnClick:(UIButton*)btn{
    
    btn.selected = !btn.isSelected;
    
}



@end
