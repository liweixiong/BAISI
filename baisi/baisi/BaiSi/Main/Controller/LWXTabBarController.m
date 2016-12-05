//
//  LWXTabBarController.m
//  baisi
//
//  Created by Mac on 16/12/5.
//  Copyright © 2016年 gzjbwm. All rights reserved.
//

#import "LWXTabBarController.h"
#import "LWXEssenceViewController.h"
#import "LWXNewViewController.h"
#import "LWXFriendTrendViewController.h"
#import "LWXMineViewController.h"
#import "LWXPublishViewController.h"
#import "UIImage+LWXRender.h"
#import "UITabBarItem+LWXFont.h"

@interface LWXTabBarController ()

@end

@implementation LWXTabBarController


//只要程序已启动,就加载到内存中去
//只会调用一次
+(void)load{
    //appearance 方法可以修改这个类的所有实例特定的外观
    UITabBarItem* tabBarItem = [UITabBarItem appearance];
    // 同种求异
//        [tabBarItem setAttributesFont:[UIFont systemFontOfSize:12]];
    //创建属性字典
    //富文本属性,图文混排
    //    NSString;
    //    NSAttributedString  ;
    NSMutableDictionary* attribu = [NSMutableDictionary dictionary];
    attribu[NSFontAttributeName] = [UIFont systemFontOfSize:12];
////    //设置字体,字体不分状态,直接使用 UIControlStateNormal
    [tabBarItem setTitleTextAttributes:attribu forState:UIControlStateNormal];
}

//这个类第一次被使用的时候
//可能会被调用多次
+(void)initialize{
    //如果在这个地方做初始化的属性处理,那么需要加上判断
    //    if (self == [XMGTabBarController class]) {
    //
    //    }
    //或者使用只调用一次的方法
    //    static dispatch_once_t onceToken;
    //    dispatch_once(&onceToken, ^{
    //        <#code to be executed once#>
    //    });
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor blackColor];
    [self setUpAllChildController];
    [self setUpAllTabBarButtons];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 设置全部的控制器
 */
- (void)setUpAllChildController {
    //1精华控制器
    LWXEssenceViewController* vc0 = [[LWXEssenceViewController alloc] init];
    vc0.view.backgroundColor = [UIColor redColor];
    //导航控制器,在实例化的时候,会它的根控制器压入到栈,
    //栈:理解为一个数组,相当于一个死胡同
    UINavigationController* nav0 = [[UINavigationController alloc] initWithRootViewController:vc0];
    [self addChildViewController:nav0];
    
    //2.新帖
    LWXNewViewController* vc1 = [[LWXNewViewController alloc] init];
    vc1.view.backgroundColor = [UIColor whiteColor];
    //导航控制器,在实例化的时候,会它的根控制器压入到栈,
    //栈:理解为一个数组,相当于一个死胡同
    UINavigationController* nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    [self addChildViewController:nav1];
    
    //3.发布
    LWXPublishViewController* vc2 = [[LWXPublishViewController alloc] init];
    vc2.view.backgroundColor = [UIColor grayColor];
    //导航控制器,在实例化的时候,会它的根控制器压入到栈,
    //栈:理解为一个数组,相当于一个死胡同
    UINavigationController* nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    [self addChildViewController:nav2];
    
    //4 关注
    LWXFriendTrendViewController* vc3 = [[LWXFriendTrendViewController alloc] init];
    vc3.view.backgroundColor = [UIColor blueColor];
    //导航控制器,在实例化的时候,会它的根控制器压入到栈,
    //栈:理解为一个数组,相当于一个死胡同
    UINavigationController* nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    [self addChildViewController:nav3];
    
    //5我的
    LWXMineViewController* vc4 = [[LWXMineViewController alloc] init];
    vc4.view.backgroundColor = [UIColor yellowColor];
    //导航控制器,在实例化的时候,会它的根控制器压入到栈,
    //栈:理解为一个数组,相当于一个死胡同
    UINavigationController* nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    [self addChildViewController:nav4];
    
}
//1.图片被渲染-->为什么被渲染,iOS7以后才有的,2.通过直接设置图片在asset,3.代码
//2中间按钮没有图片
//3.标题字体,太小,被渲染
-(void)setUpAllTabBarButtons{
    
    //0精华
    UINavigationController* vc0 = self.childViewControllers[0];
    //tabBarItem对tabbarButton的封装模型
    vc0.tabBarItem.title = @"精华";
    vc0.tabBarItem.image = [UIImage imageNamedWithRenderName:@"tabBar_essence_icon"];
    vc0.tabBarItem.selectedImage = [UIImage imageNamedWithRenderName:@"tabBar_essence_click_icon"];
    
    //创建属性字典
//    NSMutableDictionary* attribu = [NSMutableDictionary dictionary];
//    attribu[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    //    attribu[NSForegroundColorAttributeName] = [UIColor blackColor];
    //设置字体,字体不分状态,直接使用 UIControlStateNormal
//    [vc0.tabBarItem setTitleTextAttributes:attribu forState:UIControlStateNormal];
    //如果每次设置
//    [vc0.tabBarItem setAttributesFont:[UIFont systemFontOfSize:12]];

    
    //1新帖
    UINavigationController* vc1 = self.childViewControllers[1];
    vc1.tabBarItem.title = @"新帖";
    vc1.tabBarItem.image = [UIImage imageNamedWithRenderName:@"tabBar_new_icon"];
    vc1.tabBarItem.selectedImage = [UIImage imageNamedWithRenderName:@"tabBar_new_click_icon"];
    
    //2发布
    UIViewController* vc2 = self.childViewControllers[2];
    vc2.tabBarItem.image = [UIImage imageNamedWithRenderName:@"tabBar_publish_icon"];
    vc2.tabBarItem.selectedImage = [UIImage imageNamedWithRenderName:@"tabBar_publish_click_icon"];
    
    //3关注
    UINavigationController* vc3 = self.childViewControllers[3];
    vc3.tabBarItem.title = @"关注";
    vc3.tabBarItem.image = [UIImage imageNamedWithRenderName:@"tabBar_friendTrends_icon"];
    vc3.tabBarItem.selectedImage = [UIImage imageNamedWithRenderName:@"tabBar_friendTrends_click_icon"];
    //4我的
    UINavigationController* vc4 = self.childViewControllers[4];
    vc4.tabBarItem.title = @"我";
    vc4.tabBarItem.image = [UIImage imageNamedWithRenderName:@"tabBar_me_icon"];
    vc4.tabBarItem.selectedImage = [UIImage imageNamedWithRenderName:@"tabBar_me_click_icon"];
    
}


@end
