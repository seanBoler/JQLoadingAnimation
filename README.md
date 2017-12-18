# JQLoadingAnimation


## 页面加载动画/网络加载动画

## 全屏动画加载，避免出现部分先加载


# 数据加载失败 -> 提示加载失败 

![image](https://github.com/seanBoler/JQLoadingAnimation/blob/master/JQLoadAnimation/JQLoadAnimation/DBBE7BF7-A299-4752-B1E5-F6D7A60B069C.png)

# 动画加载


![image](https://github.com/seanBoler/JQLoadingAnimation/blob/master/JQLoadAnimation/JQLoadAnimation/animation.gif)


可根据需要写到webview代理，加载web加载时间过长问题

## 使用方法

      #import "JQLoadingFailed.h"
      #import "JQLoadingAnimation.h"
      
      
      创建加载view
      - (void)creatLoadingAnimation{
         //载入动画开始
         _indicator = [[JQLoadingAnimation alloc]initWithFrame:self.view.frame];
        [_indicator setLoadText:@"正在加载..."];
        [self.view addSubview:_indicator];
          /**
            * 开始载入动画
          */
        [_indicator startAnimation];
        _netWorkView = [[JQLoadingFailed alloc]initWithFrame:CGRectMake(0, Iphone_X_layoutHeight, SCREEN_WIDTH, SCREEN_HEIGHT-Iphone_X_layoutHeight)];
        _netWorkView.delegate = self;

       }
       
# 遵循<NetworkViewDelegate> 代理
       
       #pragma mark LFNoNetWorkViewDelegate
        -(void)relodeButtonClick:(NSString *)platform{
        [_netWorkView removeFromSuperview];
    
        [self performSelector:@selector(getSources) withObject:nil afterDelay:4];
    
        }
        
# 开始载入动画
      -(void)getSources{
        /**
        *  开始载入动画
        */
        [_indicator startAnimation];
        if (_block) {
           _block();
        }
    }

        
# 加载完成 
        
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
        
        
 # 加载失败       
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
 
