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
    
    
    
//    self.view.backgroundColor = [UIColor grayColor];
//    
//    UIImage * image = [UIImage imageNamed:@"IMG_3443.jpg"];
//    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width)];
//    imageView.center = self.view.center;
//    imageView.image = [self getimage:image];
//    [self.view addSubview:imageView];
}

- (UIImage *)getimage:(UIImage *)image
{
    UIImage * result;
    
    // 1.初始化图片
    // 2.开启一个与图片大小相同的上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width, image.size.height), NO, 1);
    // 3.设置一个圆形裁剪区域
    // 3.1 绘制一个圆形
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0,image.size.width - 60, image.size.height) cornerRadius:30];
    
    path.lineJoinStyle = kCGLineJoinRound;
    [path moveToPoint:CGPointMake(image.size.width - 60, 50)];
    [path addLineToPoint:CGPointMake(image.size.width - 30, 70)];
    
    [path addLineToPoint:CGPointMake(image.size.width - 60, 90)];
    
    // 3.2 把圆形的路径设置成裁剪区域
    [path addClip];
    
    
    // 4.把图片绘制到上下文中(超过裁剪区域以外的将被裁剪掉)
    [image drawAtPoint:CGPointZero];
    // 5.从上下文中获得一张新的图片
    result = UIGraphicsGetImageFromCurrentImageContext();
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    
    return result;
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
