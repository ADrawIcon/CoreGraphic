//
//  MyView.m
//  CoreGraphics
//
//  Created by jobs on 15/8/7.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import "MyView.h"

@implementation MyView

/*
 Only override drawRect: if you perform custom drawing.
 An empty implementation adversely affects performance during animation.*/
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(ctx, 10);
    
    CGContextMoveToPoint(ctx, 30, 30);
    CGContextAddLineToPoint(ctx, 100, 100);
    
    CGContextStrokePath(ctx);
    
    
//    NSString *str =  @"haha";
//    [str drawInRect:CGRectMake(150, 150, 50, 50) withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.f],NSForegroundColorAttributeName :[UIColor redColor]}];
//    
//    
//    //渲染 瞄边
//    CGContextStrokePath(ctx);
//    CGContextSetStrokeColorWithColor(ctx, [[UIColor redColor] CGColor]);
//    CGContextSetFillColorWithColor(ctx, [[UIColor blueColor] CGColor]);
//    CGContextSetLineWidth(ctx, 20);
//    
//    //[[UIColor redColor] set];
//    CGContextAddRect(ctx, CGRectMake(100, 100, 100 , 100));
//    CGContextFillPath(ctx);
//    CGContextStrokePath(ctx);
    
    //画圆
    CGContextSetLineWidth(ctx, 5);
    CGContextSetFillColorWithColor(ctx, [[UIColor redColor] CGColor]);
    CGContextMoveToPoint(ctx, 200, 200);
    CGContextAddArc(ctx, 200, 200, 100, 0, M_PI_2, 0);
    //CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
    
    CGContextSetFillColorWithColor(ctx, [[UIColor blackColor] CGColor]);
    CGContextMoveToPoint(ctx, 200, 200);
    CGContextAddArc(ctx, 200, 200, 100, M_PI_2, M_PI, 0);
    CGContextFillPath(ctx);
    
    CGContextSetFillColorWithColor(ctx, [[UIColor blueColor] CGColor]);
    CGContextMoveToPoint(ctx, 200, 200);
    CGContextAddArc(ctx, 200, 200, 100, M_PI, M_PI * 2, 0);
    CGContextFillPath(ctx);
}


@end
