//
//  ViewController.m
//  JQLoadAnimation
//
//  Created by zhangjiaqi on 2017/12/14.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//

#import "ViewController.h"
#import "JQLoadingFailed.h"
#import "JQLoadingAnimation.h"
#import "TestViewController.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define IS_IPHONE_X_UIScreen (SCREEN_HEIGHT > 736.0)
#define Iphone_X_layoutHeight (IS_IPHONE_X_UIScreen?88:64)
@interface ViewController ()<NetworkViewDelegate>{
    
    JQLoadingAnimation *_indicator;
    JQLoadingFailed *_netWorkView;
}


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(120, 200, 130, 30)];
    [button setBackgroundColor:[UIColor blueColor]];
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"打开百度网页" forState:UIControlStateNormal];
    
    [self.view addSubview:button];
}

- (void)btnAction:(UIButton *)btn{
    TestViewController *view = [[TestViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];

}

- (void)creatLoadingAnimation{
    //载入动画开始
    _indicator = [[JQLoadingAnimation alloc]initWithFrame:self.view.frame];
    [_indicator setLoadText:@"正在加载..."];
    [self.view addSubview:_indicator];
    /**
     *  开始载入动画
     */
    [_indicator startAnimation];
    _netWorkView = [[JQLoadingFailed alloc]initWithFrame:CGRectMake(0, Iphone_X_layoutHeight, SCREEN_WIDTH, SCREEN_HEIGHT-Iphone_X_layoutHeight)];
    _netWorkView.delegate = self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


#pragma mark LFNoNetWorkViewDelegate
-(void)relodeButtonClick:(NSString *)platform;
{
    [_netWorkView removeFromSuperview];
    
    [self performSelector:@selector(getSources) withObject:nil afterDelay:0.5];
    
}

-(void)getSources
{
    /**
     *  开始载入动画
     */
    [_indicator startAnimation];
    if (_block) {
        _block();
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 数据加载完毕  ->结束动画
 */
- (void)loadingdidEnd{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //[hud hide:YES];
        /**
         *  结束载入动画
         */
        [self->_indicator stopAnimationWithLoadText:@"加载完成" withType:YES];
    });
    
}

/**
 加载失败    ->结束动画
 */
- (void)loadfailed{
    dispatch_async(dispatch_get_main_queue(), ^{
        //[hud hide:YES];
        /**
         *  结束载入动画
         */
        [self.view addSubview:_netWorkView];
    });
}



@end
