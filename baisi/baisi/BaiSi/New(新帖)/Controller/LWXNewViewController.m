//
//  LWXNewViewController.m
//  baisi
//
//  Created by Mac on 16/12/5.
//  Copyright © 2016年 gzjbwm. All rights reserved.
//

#import "LWXNewViewController.h"
#import "UIBarButtonItem+LWXitem.h"
#import "LWXSubTagController.h"
@interface LWXNewViewController ()

@end

@implementation LWXNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
}

-(void)setUpNav{
    
    //titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //左侧按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonitemWithImageName:@"MainTagSubIcon" HightlightName:@"MainTagSubIconClick" target:self action:@selector(tagBtnClick)];
}

-(void)tagBtnClick{
    
    LWXSubTagController* vc = [[LWXSubTagController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
