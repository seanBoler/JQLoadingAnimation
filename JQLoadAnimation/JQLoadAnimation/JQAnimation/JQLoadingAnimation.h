//
//  JQLoadingAnimation.h
//  JQLoadAnimation
//
//  Created by zhangjiaqi on 2017/12/14.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JQLoadingAnimation : UIView
{
    UIImageView *imageView;
    UILabel *Infolabel;
}
@property (nonatomic, assign) NSString *loadtext;
@property (nonatomic, readonly) BOOL isAnimating;
//use this to init
- (id)initWithFrame:(CGRect)frame;
-(void)setLoadText:(NSString *)text;

- (void)startAnimation;
- (void)stopAnimationWithLoadText:(NSString *)text withType:(BOOL)type;



@end
