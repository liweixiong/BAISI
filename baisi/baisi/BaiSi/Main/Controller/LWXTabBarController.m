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
#import "LWXNaVViewController.h"

@interface LWXTabBarController ()
@property(nonatomic,weak)UIButton* publishBtn;

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
    
//        tabBarItem.title = @"jdjjd";
    //1.是不是所有的类都可以拿Appearance进行修改外观,并不是所有的类都可以使用Appearance,遵守协议UIAppearance,实现协议的方法
    //2.我们appearance拿到的对象,是不是可以修改对象内部所有的属性或者调用方法-->不可以,只有被 UI_APPEARANCE_SELECTOR 修饰的方法或者属性才能够被appearance返回的对象调用
    //如果想使用appearance返回的对象的设置产生效果,必须设置必须要在View的显示之前
 
    
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

//懒加载控件的时候,一定要在创建那一刻添加父控件上
-(UIButton *)publishBtn{
    if (_publishBtn==nil) {
        
        UIButton* publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _publishBtn = publishBtn;
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishBtn sizeToFit];
        [publishBtn addTarget:self action:@selector(publishBtnClick) forControlEvents:UIControlEventTouchUpInside];
        //设置中点之前一定要先有尺寸
        //    publishBtn.center = self.tabBar.center; //绝对不可以
        [self.tabBar addSubview:publishBtn];
        
    }
    
    return _publishBtn;
}

//发布按钮被点击
-(void)publishBtnClick{
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor blackColor];
    [self setUpAllChildController];
    [self setUpAllTabBarButtons];

    //懒加载publish按钮,并设置位置
    self.publishBtn.center = CGPointMake(self.tabBar.bounds.size.width*0.5, self.tabBar.bounds.size.height*0.5);
    // 设置我们tabbar的背景图片
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

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
    LWXNaVViewController* nav0 = [[LWXNaVViewController alloc] initWithRootViewController:vc0];
    [self addChildViewController:nav0];
    
    //2.新帖
    LWXNewViewController* vc1 = [[LWXNewViewController alloc] init];
    vc1.view.backgroundColor = [UIColor whiteColor];
    //导航控制器,在实例化的时候,会它的根控制器压入到栈,
    //栈:理解为一个数组,相当于一个死胡同
    LWXNaVViewController* nav1 = [[LWXNaVViewController alloc] initWithRootViewController:vc1];
    [self addChildViewController:nav1];
    
    //3.发布
    LWXPublishViewController* vc2 = [[LWXPublishViewController alloc] init];
    vc2.view.backgroundColor = [UIColor grayColor];
    [self addChildViewController:vc2];
    
    //4 关注
    LWXFriendTrendViewController* vc3 = [[LWXFriendTrendViewController alloc] init];
    vc3.view.backgroundColor = [UIColor blueColor];
    //导航控制器,在实例化的时候,会它的根控制器压入到栈,
    //栈:理解为一个数组,相当于一个死胡同
    LWXNaVViewController* nav3 = [[LWXNaVViewController alloc] initWithRootViewController:vc3];
    [self addChildViewController:nav3];
    
    //5我的
    LWXMineViewController* vc4 = [[LWXMineViewController alloc] init];
    vc4.view.backgroundColor = [UIColor yellowColor];
    //导航控制器,在实例化的时候,会它的根控制器压入到栈,
    //栈:理解为一个数组,相当于一个死胡同
    LWXNaVViewController* nav4 = [[LWXNaVViewController alloc] initWithRootViewController:vc4];
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
    vc2.tabBarItem.enabled = NO;

//    vc2.tabBarItem.image = [UIImage imageNamedWithRenderName:@"tabBar_publish_icon"];
//    vc2.tabBarItem.selectedImage = [UIImage imageNamedWithRenderName:@"tabBar_publish_click_icon"];
//    //1.首先尝试可否直接修改tabBarItem的 frame 值
        // vc2.tabBarItem.fram//无法取到 frame 值
    //    vc2.navigationController.tabBarItem.frame

        // UITabBarButton *button=self.tabBar.subviews[2];  无法取到UITabBarButton
    //2.思考的问题:除了 frame 还有什么可以改变位置
        //
    //3.
//      vc2.tabBarItem.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);
    
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
