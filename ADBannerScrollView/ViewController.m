//
//  ViewController.m
//  ADBannerScrollView
//
//  Created by lixingqiao01@163.com on 15/12/7.
//  Copyright © 2015年 lixingqiao01@163.com. All rights reserved.
//

#import "ViewController.h"
#import "ADScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect rect = [UIScreen mainScreen].bounds;
    NSArray *imagePath = [NSArray arrayWithObjects:@"http://s0.hao123img.com/res/r/image/2015-12-07/cc437f2c431358be27fd69dfbf5a04f5.jpg",@"http://s0.hao123img.com/res/r/image/2015-12-07/bf0eb0980dd99b3753198e5ac5011feb.jpg",@"http://s0.hao123img.com/res/r/image/2015-12-07/111540120c81e63529e708b6f798031b.jpg",@"http://s0.hao123img.com/res/r/image/2015-12-07/3bc5cb0cbc026f6075e772eeeb998385.jpg", nil];
    ADScrollView *adView = [[ADScrollView alloc]initWithFrame:CGRectMake(0, 20, rect.size.width, 150) ImageURLArray:imagePath TimeInterval:3];
    adView.pageController.frame = CGRectMake(0, 150, rect.size.width, 20);
    [self.view addSubview:adView];
    [self.view addSubview:adView.pageController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
