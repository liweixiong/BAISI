//
//  LWXNaVControllerViewController.m
//  baisi
//
//  Created by Mac on 16/12/5.
//  Copyright © 2016年 gzjbwm. All rights reserved.
//

#import "LWXNaVViewController.h"
#import "LWXNavBar.h"
#import "LWXBackView.h"
@interface LWXNaVViewController ()<UIGestureRecognizerDelegate>

@end

@implementation LWXNaVViewController

+(void)load{
    
    //设置我们标题
    UINavigationBar* bar = [UINavigationBar appearance];
    NSMutableDictionary* attribu = [NSMutableDictionary dictionary];
    attribu[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
    [bar  setTitleTextAttributes:attribu];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}



-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //    xmgLog(@"%s",__func__)
    
    //判断我们根控制器
    //    if (self.childViewControllers[0]==viewController) {
    //           }
    //等于0的时候,是正在push根控制器
    if (self.childViewControllers.count>0) {//非根控制器
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[LWXBackView backViewWithImageName:@"navigationButtonReturn" HightlightName:@"navigationButtonReturnClick" target:self action:@selector(back)]];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

/***
 

 
 手势的原始代理
 <UIScreenEdgePanGestureRecognizer: 0x7fc61ad0e240; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7fc61ac0c040>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7fc61ad0d7d0>)>>
 
 这个手势打印
 **/

- (void)viewDidLoad {
    [super viewDidLoad];
    LWXNavBar* bar = [[LWXNavBar alloc] init];
    //    self.navigationBar = bar;
    [self setValue:bar forKey:@"navigationBar"];
//    lwxLog(@"%@",self.interactivePopGestureRecognizer);
//    lwxLog(@"%@",self.interactivePopGestureRecognizer.delegate);
//        self.interactivePopGestureRecognizer.delegate = self;

    id target=self.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *fullScreenGes=[[UIPanGestureRecognizer alloc]initWithTarget:target action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:fullScreenGes];
    fullScreenGes.delegate=self;
    self.interactivePopGestureRecognizer.enabled=NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)back {
    
    [self popViewControllerAnimated:YES];
}


#pragma mark UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    //子控制器才能增加手势
//    return self.childViewControllers.count>1;
        return self.childViewControllers.count>1;
}

@end
