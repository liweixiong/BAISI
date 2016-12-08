//
//  LWXEssenceControllerViewController.m
//  baisi
//
//  Created by Mac on 16/12/5.
//  Copyright © 2016年 gzjbwm. All rights reserved.
//

#import "LWXEssenceViewController.h"
#import "UIBarButtonItem+LWXitem.h"

@interface LWXEssenceViewController ()

@end

@implementation LWXEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
  }

/**
 设置导航控制器
 */
-(void)setUpNav{
    //titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //左侧按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonitemWithImageName:@"nav_item_game_iconN" HightlightName:@"nav_item_game_click_iconN" target:self action:@selector(gameBtnClick)];
    
    
    
    //右侧按钮
    self.navigationItem.rightBarButtonItem =[UIBarButtonItem barButtonitemWithImageName:@"navigationButtonRandomN" HightlightName:@"navigationButtonRandomClickN" target:self action:@selector(randomBtnClick)];
    
}


-(void)gameBtnClick{
    NSLog(@"游戏按钮被点击");
    
    
}
-(void)randomBtnClick{
    NSLog(@"随机按钮被点击");
    
    
}

@end
