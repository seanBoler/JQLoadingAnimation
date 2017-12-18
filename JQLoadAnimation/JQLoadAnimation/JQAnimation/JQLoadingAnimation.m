//
//  JQLoadingAnimation.m
//  JQLoadAnimation
//
//  Created by zhangjiaqi on 2017/12/14.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//

#import "JQLoadingAnimation.h"
#define  RGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@implementation JQLoadingAnimation


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self creatImageView];
    }
    return self;
}

- (void)creatImageView{
    _isAnimating = NO;
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-215/4,self.frame.size.height/2-150-40, 215/2,300/2)];
    [self addSubview:imageView];
    //设置动画帧
    imageView.animationImages=[NSArray arrayWithObjects:
                               [UIImage imageNamed:@"timg1"],
                               [UIImage imageNamed:@"timg2"],
                               [UIImage imageNamed:@"timg3"],
                               [UIImage imageNamed:@"timg4"],
                               [UIImage imageNamed:@"timg5"],
                               [UIImage imageNamed:@"timg6"],
                               [UIImage imageNamed:@"timg7"],
                               [UIImage imageNamed:@"timg8"],
                               [UIImage imageNamed:@"timg9"],
                               [UIImage imageNamed:@"timg10"],
                               [UIImage imageNamed:@"timg11"],
                               [UIImage imageNamed:@"timg12"],
                               [UIImage imageNamed:@"timg13"],
                               [UIImage imageNamed:@"timg14"],
                               [UIImage imageNamed:@"timg15"],
                               nil ];
    
    
    Infolabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+20, self.frame.size.width, 20)];
    Infolabel.backgroundColor = [UIColor clearColor];
    Infolabel.textAlignment = NSTextAlignmentCenter;
    Infolabel.textColor = RGBColor(219, 59, 55);
    Infolabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:Infolabel];
    
    self.layer.hidden = YES;
}


- (void)startAnimation
{
    _isAnimating = YES;
    self.layer.hidden = NO;
    [self doAnimation];
}

-(void)doAnimation{
    
    Infolabel.text = _loadtext;
    //设置动画总时间
    imageView.animationDuration=4;
    //设置重复次数,0表示不重复
    imageView.animationRepeatCount=0;
    //开始动画
    [imageView startAnimating];
}

- (void)stopAnimationWithLoadText:(NSString *)text withType:(BOOL)type;
{
    //[dataView stop];
    _isAnimating = NO;
    Infolabel.text = text;
    if(type){
        
        [UIView animateWithDuration:0.3f animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [imageView stopAnimating];
            self.layer.hidden = YES;
            self.alpha = 1;
        }];
    }else{
        [imageView stopAnimating];
        [imageView setImage:[UIImage imageNamed:@"lf3"]];
    }
    
}


-(void)setLoadText:(NSString *)text;
{
    if(text){
        _loadtext = text;
    }
}



@end
