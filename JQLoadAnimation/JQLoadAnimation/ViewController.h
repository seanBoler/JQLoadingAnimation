//
//  ViewController.h
//  JQLoadAnimation
//
//  Created by zhangjiaqi on 2017/12/14.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void(^sucessBlock)();
@interface ViewController : UIViewController


@property  (nonatomic,strong)sucessBlock block;

- (void)creatLoadingAnimation;  //添加动画
/**
 数据加载完毕  ->结束动画
 */
-(void)getSources;
- (void)loadingdidEnd;
- (void)loadfailed;
@end

