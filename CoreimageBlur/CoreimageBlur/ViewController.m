//
//  ViewController.m
//  CoreimageBlur
//
//  Created by lanou on 16/1/9.
//  Copyright (c) 2016年 lanou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"sourceImage2.jpg"];
 //coreImage部分
    CIImage *ciImage = [[CIImage alloc]initWithImage:image];
    //CIFilter 滤镜
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setValue:@(10) forKey:@"inputRadius"];
    //将图片输入到滤镜中
    [blurFilter setValue:ciImage forKey:kCIInputImageKey];
    //用来查询滤镜可以设置的参数以及一些相关的信息
    NSLog(@"%@",[blurFilter attributes]);
    
    //将处理好的图片输出
    CIImage *outCiImage = [blurFilter valueForKey:kCIOutputImageKey];
    //CIContext
    CIContext *context = [CIContext contextWithOptions:nil];
    //获取CGImage句柄.....从数据流中取出TA的数据
    CGImageRef outCGImage = [context createCGImage:outCiImage fromRect:[outCiImage extent]];
    //最终获取到图片
    UIImage *blurImage = [UIImage imageWithCGImage:outCGImage];
    //释放CGImage句柄
    CGImageRelease(outCGImage);
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 392, 220)];
    imageView.image = blurImage;
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
   
}



@end
