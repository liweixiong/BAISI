//
//  LWXFriendTrendViewController.m
//  baisi
//
//  Created by Mac on 16/12/5.
//  Copyright © 2016年 gzjbwm. All rights reserved.
//

#import "LWXFriendTrendViewController.h"
#import "UIBarButtonItem+LWXitem.h"
@interface LWXFriendTrendViewController ()

@end

@implementation LWXFriendTrendViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
}



-(void)setUpNav{
    
    //titleView
    self.navigationItem.title = @"我的关注";
    
    //左侧按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonitemWithImageName:@"friendsRecommentIcon" HightlightName:@"friendsRecommentIcon-click" target:self action:@selector(addFriend)];
    
    
}

-(void)addFriend{
    
    
    
}
@end
