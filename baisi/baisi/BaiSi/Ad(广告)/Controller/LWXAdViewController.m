//
//  LWXAdViewController.m
//  baisi
//
//  Created by Mac on 16/12/6.
//  Copyright © 2016年 gzjbwm. All rights reserved.
//

#import "LWXAdViewController.h"
#import <AFNetworking.h>
#import "AFHTTPSessionManager+LWXManager.h"
#import "LWXAdModel.h"
#import <MJExtension.h>
#import "NSString+LWXURL.h"
#import <UIImageView+WebCache.h>
#import "LWXTabBarController.h"

#define XMGScreenW [UIScreen mainScreen].bounds.size.width
#define XMGScreenH [UIScreen mainScreen].bounds.size.height
#define iPhone6P  XMGScreenH == 736
#define iPhone6   XMGScreenH == 667
#define iPhone5   XMGScreenH == 568
#define iPhone4   XMGScreenH == 480
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface LWXAdViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, strong)  LWXAdModel* adModel;
@property (nonatomic, weak) NSTimer* timer ;

@property (weak, nonatomic) IBOutlet UIButton *skipBtn;


@end

@implementation LWXAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setuPLaunchImage];
    [self loadData];
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRunning) userInfo:nil repeats:YES];
    self.timer = timer;
    [timer fire];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//占位,控件多,控件层次确定,尺寸或者位置是不固定的
- (IBAction)buttonClick:(UIButton *)sender {
    // 1.点击按钮,切换窗口的根控制器
    //2设置窗口的根控制器
    LWXTabBarController* rootVc = [[LWXTabBarController alloc] init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController =rootVc;
    [self.timer invalidate];
    self.timer = nil;

}
//获取网络数据
-(void)loadData{
    //1.创建网络请求管理者
    AFHTTPSessionManager* mgr = [AFHTTPSessionManager lwx_manager];
    mgr.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];

    //2.拼接请求参数
    NSMutableDictionary*dic = [NSMutableDictionary dictionary];
    dic[@"code2"] =code2;
    //3.发送请求
    [mgr lwx_GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [responseObject writeToFile:@"/Users/mac/Desktop/svn/b.plist" atomically:YES];
        
        NSArray* adArr = responseObject[@"ad"];
        if (adArr.count==0) return ;
        NSDictionary* adDic = adArr.firstObject;
        //字典转模型,把一个字典转换成一个模型
        LWXAdModel* adModel = [LWXAdModel mj_objectWithKeyValues:adDic];
        self.adModel = adModel;

        CGFloat h = adModel.h*XMGScreenW/adModel.w;
        CGRect frame  = CGRectMake(0, 0, XMGScreenW, h);
        UIImageView* adImageView = [[UIImageView alloc] initWithFrame:frame];
        adImageView.userInteractionEnabled = YES;
        [self.contentView addSubview:adImageView];
        [adImageView sd_setImageWithURL:adModel.w_picurl.lwx_url];
        
        // 给图片增加一个点按手势
        UITapGestureRecognizer* tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(AdViewBeClick)];
        [adImageView addGestureRecognizer:tapGes];
        
        lwxLog(@"%@",responseObject)
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        lwxLog(@"%@",error)
    }];

}


- (void)setuPLaunchImage {
    //选取图片
    UIImage* image = nil;
    if (iPhone6P) {
        image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h"];
    }else if (iPhone6){
        image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    }else if (iPhone5){
        image = [UIImage imageNamed:@"LaunchImage-700-568h"];
    }else if (iPhone4){
        image = [UIImage imageNamed:@"LaunchImage"];
    }
    self.launchImageView.image = image;
}


// 点击跳转
-(void)AdViewBeClick{
    
    if ( [[UIApplication sharedApplication] canOpenURL:_adModel.ori_curl.lwx_url]) {
        
        [[UIApplication sharedApplication] openURL:_adModel.ori_curl.lwx_url];
    }
    
}


-(void)timerRunning{
    static int sec = 3;
    
    NSString* title = [NSString stringWithFormat:@"跳过(%d)",sec];
    [self.skipBtn setTitle:title forState:UIControlStateNormal];
    sec--;
    if (sec==-1) {
        [self buttonClick:nil];
    }
    
}



@end
