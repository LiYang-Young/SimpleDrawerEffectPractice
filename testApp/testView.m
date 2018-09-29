//
//  testView.m
//  testApp
//
//  Created by 李洋 on 2018/7/17.
//  Copyright © 2018年 com.appTest.app. All rights reserved.
//

#import "testView.h"

@implementation testView

- (void)drawRect:(CGRect)rect {
    // Drawing code
////    NSString * str = @"此时";
////    // 两者区别在于，指定了宽度，文字可以换行
////    [str drawInRect:CGRectMake(0, 0, 50, 50) withAttributes:nil];
////    [str drawAtPoint:CGPointMake(0, 0) withAttributes:nil];
////
////    UIImage * image = [UIImage imageNamed:@""];
////    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
////    // 可以实现平铺的效果，类似铺地板砖一样
////    [image drawAsPatternInRect:CGRectMake(0, 0, 500, 500)];
//    // 1获取上下文 （获取、创建上下文都以UIGraphics开头）
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    // 2绘制路径
//    UIBezierPath * path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(50, 50)];
//    [path addLineToPoint:CGPointMake(100, 200)];
//    // 设置线宽
//    CGContextSetLineWidth(ctx, 10);
//    // 设置颜色
//    [[UIColor redColor] set];
//    // 3把绘制的内容添加到上下文中
//    CGContextAddPath(ctx, path.CGPath);
//    // 4把上下文的内容显示到view上（渲染到view的layer上）（stroke fill）
//    CGContextStrokePath(ctx);
//
//    // 保存当前上下文状态到状态栈
//    CGContextSaveGState(ctx);
//    // 从上下文状态栈中取出栈顶状态恢复当前上下文的状态
//    CGContextRestoreGState(ctx);
//
//    // 平移
//    CGContextTranslateCTM(ctx, 100, 100);
//    // 旋转
//    CGContextRotateCTM(ctx, M_PI_4);
//    // 缩放
//    CGContextScaleCTM(ctx, 1.5, 1.5);
    
//    // 1.初始化图片
//    UIImage * image = [UIImage imageNamed:@""];
//    // 2.开启一个与图片大小相同的上下文
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width, image.size.height), NO, 1);
//    // 3.设置一个圆形裁剪区域
//    // 3.1 绘制一个圆形
//    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
//    // 3.2 把圆形的路径设置成裁剪区域
//    [path addClip];
//    // 4.把图片绘制到上下文中(超过裁剪区域以外的将被裁剪掉)
//    [image drawAtPoint:CGPointZero];
//    // 5.从上下文中获得一张新的图片
//    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
//    // 6.关闭上下文
//    UIGraphicsEndImageContext();
    
    // 1.加载图片
    UIImage * image = [UIImage imageNamed:@""];
    // 2.确定边框宽度
    CGFloat borderW = 10;
    // 3.开启一个上下文 大小要预留出边框的宽度
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size, NO, 1);
    // 4.绘制大圆，目的是能显示出来边框
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    // 设置边框颜色
    [[UIColor redColor] set];
    [path fill];
    // 5.绘制一个小圆，大小和图片一样大，并设置成裁剪区域
    UIBezierPath * clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [clipPath addClip];
    // 6.从上下文中获得一张新的图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 7.关闭上下文
    UIGraphicsEndImageContext();
    
    
    
//    UIGraphicsBeginImageContextWithOptions(size, NO, 1);
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    // 把view绘制到上下文中，必须使用渲染的方式，而且只能用layer渲染
//    [self.imageV.layer renderInContext:ctx];
//    // 擦除区域
//    CGContextClearRect(ctx, rect);
//    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
    
}

@end
