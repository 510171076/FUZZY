//
//  ViewController.m
//  UIVisualEffectViewLabel
//
//  Created by lanou on 16/1/23.
//  Copyright (c) 2016年 lanou. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"
#define kWdith self.view.frame.size.width
#define kHeight self.view.frame.size.height
@interface ViewController ()
@property (nonatomic,retain)UIScrollView *scrollerView;
@end

@implementation ViewController
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    if (offset.x + kWdith > scrollView.contentSize.width) {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
    if (offset.x < 0) {
        [scrollView setContentOffset:CGPointMake(6 * kWdith, 0) animated:NO];
    }
}

- (void)jump{
    MyViewController *myVC = [[MyViewController alloc]init];
    [self presentViewController:myVC animated:YES completion:nil];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(change) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
   _scrollerView = [[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    _scrollerView.contentSize = CGSizeMake(kWdith * 7, kHeight);
    _scrollerView.pagingEnabled = YES;
    _scrollerView.delegate = self;
    _scrollerView.contentOffset = CGPointMake(kWdith, 0);
    _scrollerView.showsHorizontalScrollIndicator = NO;
    _scrollerView.tag = 101;
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"6.jpg"]];
    imageView.frame = CGRectMake(50, 0, kWdith - 100, kHeight - 200);
    [_scrollerView addSubview:imageView];
    
    for (int i = 0 ; i < 6; i ++) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i + 1]]];
        imageView.frame = CGRectMake(kWdith * (i + 1) +50, 0, kWdith - 100, kHeight - 200);
        [_scrollerView addSubview:imageView];
        
    }
    [self.view addSubview:_scrollerView];
  
    

 
    //实时渲染的模糊效果
    //1.创建模糊View
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];//选择模糊效果
   effectView.frame = CGRectMake(50, 417, 275, 50);
//   effectView.frame = imageView.frame;
    [self.view addSubview:effectView];

    
    
    
  
    //添加显示文本
    UILabel *label = [[UILabel alloc]initWithFrame:effectView.bounds];
    label.text = @"你好";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:38];
//    [effectView addSubview:label];
    
    //添加模糊子视图
    UIVisualEffectView *subEffectView = [[UIVisualEffectView alloc]initWithEffect:[UIVibrancyEffect effectForBlurEffect:(UIBlurEffect *)effectView.effect]];//我们添加这个模糊子视图的时候要将这个子视图添加到上面的effectView当中去，所以要和effectView效果类型保持一致
    subEffectView.frame =effectView.bounds;
    [effectView.contentView addSubview:subEffectView];
    [subEffectView.contentView addSubview:label];
 /**/
    
   /*
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"hello" forState:UIControlStateNormal];
    [button setTintColor:[UIColor redColor]];
    [button setFont:[UIFont boldSystemFontOfSize:30]];
    
    [button addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(50, 60, 100, 30);
    
//    [effectView addSubview:button];
    
    UIVisualEffectView *subEffectView1 = [[UIVisualEffectView alloc]initWithEffect:[UIVibrancyEffect effectForBlurEffect:(UIBlurEffect *)effectView.effect]];
    subEffectView1.frame =effectView.bounds;
    [effectView.contentView addSubview:subEffectView1];
     [subEffectView1.contentView addSubview:button];
*/

    
    
}
- (void)change{
    static int i = 0;

    if (++i >5) {
        i = 0;
    }
    _scrollerView.contentOffset = CGPointMake(kWdith * (i + 1), 0);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
