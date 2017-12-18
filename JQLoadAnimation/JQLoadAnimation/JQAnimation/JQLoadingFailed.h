//
//  JQLoadingFailed.h
//  JQLoadAnimation
//
//  Created by zhangjiaqi on 2017/12/14.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NetworkViewDelegate <NSObject>

-(void)relodeButtonClick:(NSString *)platform;

@end


@interface JQLoadingFailed : UIView
@property(nonatomic,strong)NSString *type;
@property(nonatomic,assign)id<NetworkViewDelegate> delegate;

@end
