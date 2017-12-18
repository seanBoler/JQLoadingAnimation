//
//  JQLoadingFailed.m
//  JQLoadAnimation
//
//  Created by zhangjiaqi on 2017/12/14.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#import "JQLoadingFailed.h"
#define  RGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@implementation JQLoadingFailed

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addCountentView];
    }
    return self;
}

-(void)addCountentView
{
    self.backgroundColor=[UIColor whiteColor];
    UIImageView *wifiImage=[[UIImageView alloc]init];
    
    wifiImage.frame=CGRectMake(SCREEN_WIDTH/2-40, SCREEN_HEIGHT/2-170, 80, 80);
    UILabel *titleLbl=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(wifiImage.frame)+30, SCREEN_WIDTH, 20)];
    
    wifiImage.image=[UIImage imageNamed:@"fl3"];
    titleLbl.text = @"网络连接异常，请检查网络。";
    
    [self addSubview:wifiImage];
    titleLbl.font=[UIFont systemFontOfSize:14];
    titleLbl.textColor=  RGBColor(152, 162, 192);
    titleLbl.textAlignment=NSTextAlignmentCenter;
    [self addSubview:titleLbl];
    UIButton *relodeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    relodeBtn.backgroundColor = RGBColor(219, 59, 55);
    relodeBtn.frame= CGRectMake(SCREEN_WIDTH/2-40, SCREEN_HEIGHT/2-20, 80, 30);
    [relodeBtn setTitle:@"刷新重试" forState:UIControlStateNormal];
    relodeBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    relodeBtn.layer.cornerRadius=5.0;
    relodeBtn.layer.masksToBounds=YES;
    [relodeBtn addTarget:self action:@selector(shareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:relodeBtn];
}
-(void)shareButtonClick:(UIButton *)button
{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(relodeButtonClick:)])
        {
        [self.delegate relodeButtonClick:button.titleLabel.text];
        }
    
}

@end
