//
//  MyViewController.m
//  UIVisualEffectViewLabel
//
//  Created by lanou on 16/1/26.
//  Copyright (c) 2016年 lanou. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (nonatomic,strong)UIScrollView *scrollView;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView = [[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"6.jpg"]];
    
    self.scrollView.bounces = NO;
    self.scrollView.contentSize = imageView.image.size;
    [self.scrollView addSubview:imageView];
    [self.view addSubview:self.scrollView];
    
    //添加模糊效果
    //1.创建模糊效果
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle: UIBlurEffectStyleLight]];
    //2.设定尺寸
    effectView.frame = CGRectMake(0, 100, 375, 150);
    
    //3.添加到View当中
    [self.view addSubview: effectView];//模糊效果要放在scrollerView的上面
    //添加显示的文本
    UILabel *label = [[UILabel alloc]initWithFrame:effectView.bounds];
    label.text = @"蓝鸥最帅的男人之。。。";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:50];

    
  
    UIVisualEffectView *subEffectView = [[UIVisualEffectView alloc]initWithEffect:[UIVibrancyEffect effectForBlurEffect:(UIBlurEffect *)effectView.effect]];
    //2.设定尺寸
    subEffectView.frame = effectView.bounds;
    //3.将子模糊View添加到effectView的contentView才能生效
    [effectView.contentView addSubview:subEffectView];
    //4.添加要显示的view来达到特殊的效果
    [subEffectView.contentView addSubview:label];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
