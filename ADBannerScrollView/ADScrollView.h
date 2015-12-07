//
//  ADScrollView.h
//  MICloud
//
//  Created by lixingqiao01@163.com on 15/12/5.
//  Copyright © 2015年 lixingqiao01@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#define MAINSCREEN_BOUND [UIScreen mainScreen].bounds

@protocol ADScrollViewDelegate <NSObject>
/**
 *  轮播广告代理事件
 *
 *  @param indexPage 获取当前点击的图片ID
 */
- (void)BannerEventTouchUpInside:(int)indexPage;

@end

@interface ADScrollView : UIScrollView<UIScrollViewDelegate>
@property (nonatomic, strong) NSArray *imagePathArray;
@property (nonatomic, strong) UIPageControl *pageController;
@property (nonatomic, assign) float timeInterval;
@property (nonatomic, strong) id<ADScrollViewDelegate>AD_delegate;

/**
 *  初始化广告视图
 *
 *  @param frame        设置显示位置和大小
 *  @param imageArray   存有图片网络地址的数组
 *  @param TimeInterval 设置轮播的时间
 *
 *  @return id
 */
- (id)initWithFrame:(CGRect)frame ImageURLArray:(NSArray *)imageArray TimeInterval:(float)TimeInterval;

@end
