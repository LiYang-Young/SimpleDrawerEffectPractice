//
//  ViewController.m
//  testApp
//
//  Created by 李洋 on 2018/5/21.
//  Copyright © 2018年 com.appTest.app. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIView *leftView;
@property (nonatomic,strong) UIView *rightView;
@property (nonatomic,strong) UIView *mainView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];

    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.mainView addGestureRecognizer:pan];
}

- (void)createView
{
    self.leftView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.leftView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.leftView];
    
    self.rightView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.rightView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.rightView];
    
    self.mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.mainView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.mainView];
    
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    // 获取偏移量
    CGPoint transP = [pan translationInView:self.mainView];
    self.mainView.frame = [self frameWithOffsetX:transP.x];
    
    if (self.mainView.frame.origin.x < 0) {
        self.rightView.hidden = NO;
    }else if (self.mainView.frame.origin.x >= 0)
    {
        self.rightView.hidden = YES;
    }
    
    CGFloat target = 0;
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (self.mainView.frame.origin.x > 375 * 0.5) {
            target = 300;
        }else if(CGRectGetMaxX(self.mainView.frame) < 375 * 0.5)
        {
            target = -300;
        }
        
        CGFloat offsetx = target - self.mainView.frame.origin.x;
        [UIView animateWithDuration:0.5 animations:^{
            
            self.mainView.frame = [self frameWithOffsetX:offsetx];
        }];
        
    }
    
    // 复位 一定不要忘记复位,一定不要忘记复位,一定不要忘记复位
    [pan setTranslation:CGPointZero inView:self.mainView];
}

// 根据偏移量 返回frame
- (CGRect)frameWithOffsetX:(CGFloat)offsetX
{
    CGRect frame = self.mainView.frame;
    // 修改x值
    frame.origin.x += offsetX;
    // 修改y值 比例
    frame.origin.y = fabs(frame.origin.x * 100 / 375);
    // 修改高度
    frame.size.height = self.view.frame.size.height - 2 * frame.origin.y;
    
    return frame;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
