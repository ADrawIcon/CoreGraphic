//
//  ViewController.m
//  CoreGraphics
//
//  Created by jobs on 15/8/7.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "POP.h"

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyView *myView = [[MyView alloc] initWithFrame:self.view.bounds];
    myView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:myView];
    
    //创建贝塞尔曲线
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 400)];
    
    [path addLineToPoint:CGPointMake(100, 300)];
    [path moveToPoint:CGPointMake(100, 300)];
    
    [path addLineToPoint:CGPointMake(200, 400)];
    [path moveToPoint:CGPointMake(200, 400)];
    [path addLineToPoint:CGPointMake(300, 500)];
    [path moveToPoint:CGPointMake(300, 500)];
    [path addLineToPoint:CGPointMake(400, 200)];
    
    //支付宝的账单动画(圆)
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 400) radius:100 startAngle:0 endAngle:M_PI *2 clockwise:1];
    
    //颜色渐变
    //CAGradientLayer
    
    //矩形
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(40, 300)];
    [path2 addLineToPoint:CGPointMake(40, 100)];
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path1.CGPath;
    shapeLayer.fillColor = [[UIColor blueColor] CGColor];
    shapeLayer.lineWidth =5;
    shapeLayer.strokeColor = [[UIColor redColor] CGColor];
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    anim.duration = 2;
    anim.fromValue = @(1);
    anim.toValue = @(0);
    anim.autoreverses = NO;
    anim.removedOnCompletion = NO;
    [shapeLayer addAnimation:anim forKey:@"strokenStart"];
    
    
    POPCustomAnimation *cus=[POPCustomAnimation animationWithBlock:^BOOL(id target, POPCustomAnimation *animation) {
        CAShapeLayer *shapeLayer = target;
        shapeLayer.strokeEnd += 0.01;
        if (shapeLayer.strokeEnd >= 1) {
            return NO;
        } else {
            return YES;
        }
        
        
    }];
    shapeLayer.strokeEnd = 0;
    [shapeLayer pop_addAnimation:cus forKey:@"ad"];
    
    //弹性动画
    //damping指阻尼 值越小震动越大
    //Velocity速度
    UIView *view1 =[[UIView alloc] initWithFrame:CGRectMake(30, 400, 80, 80)];
    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view1.frame = CGRectMake(260, 200, 80, 80);
    } completion:nil];
    
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.delegate =self;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"www.baidu.com"]]];
    [self.view addSubview:webView];
    
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [webView stringByEvaluatingJavaScriptFromString:@"<script type='text/script'>"];
    return YES;
}



@end
