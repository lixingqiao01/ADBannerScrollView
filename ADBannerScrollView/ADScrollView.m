//
//  ADScrollView.m
//  MICloud
//
//  Created by lixingqiao01@163.com on 15/12/5.
//  Copyright © 2015年 lixingqiao01@163.com. All rights reserved.
//

#import "ADScrollView.h"

@interface ADScrollView(){
    int pageNum;
    NSTimer *_timer;
}
@end

@implementation ADScrollView

- (id)initWithFrame:(CGRect)frame ImageURLArray:(NSArray *)imageArray TimeInterval:(float)TimeInterval{
    self.timeInterval = TimeInterval/2;
    self = [super initWithFrame:frame];
    if (self) {
        pageNum = 1;
        self.imagePathArray = imageArray;
        self.bounces = NO;
        self.pagingEnabled = YES;
        self.delegate = self;
        self.contentOffset = CGPointMake(frame.size.width, 0);
        self.contentSize = CGSizeMake(frame.size.width * (imageArray.count + 2), frame.size.height);
        for (int i = 0; i < imageArray.count + 2; i++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width * i, 0, frame.size.width, frame.size.height)];
            imageView.userInteractionEnabled = YES;
            if (i == 0) {
                [imageView sd_setImageWithURL:[NSURL URLWithString:imageArray[imageArray.count - 1]]];
                
            } else if (i == imageArray.count + 1) {
                [imageView sd_setImageWithURL:[NSURL URLWithString:imageArray[0]]];
            } else {
                [imageView sd_setImageWithURL:[NSURL URLWithString:imageArray[i - 1]]];
                imageView.tag = 1230 + (i - 1);
                
            }
            imageView.image = [UIImage imageNamed:@"image1"];
            UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestClick:)];
            [imageView addGestureRecognizer:tapGest];
            [self addSubview:imageView];
        }
        _timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(repeatClick) userInfo:nil repeats:YES];
        self.showsHorizontalScrollIndicator = NO;
        self.pageController = [[UIPageControl alloc]init];
        self.pageController.numberOfPages = self.imagePathArray.count;
        self.pageController.userInteractionEnabled = NO;
        self.pageController.currentPageIndicatorTintColor = [UIColor grayColor];
        self.pageController.pageIndicatorTintColor = [UIColor whiteColor];
        self.pageController.currentPage = 0;
        [self.superview addSubview:self.pageController];
        
    }
    return self;
}

- (void)tapGestClick:(UITapGestureRecognizer *)tapGest{
    [self.AD_delegate BannerEventTouchUpInside:(int)tapGest.view.tag - 1230];
}

- (void)repeatClick{
    pageNum ++;
    [self setContentOffset:CGPointMake(MAINSCREEN_BOUND.size.width * pageNum, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x/MAINSCREEN_BOUND.size.width == self.imagePathArray.count + 1) {
                scrollView.contentOffset = CGPointMake(MAINSCREEN_BOUND.size.width, 0);
    }
    pageNum = (int)self.contentOffset.x/MAINSCREEN_BOUND.size.width - 1;
    self.pageController.currentPage = pageNum;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(repeatClick) userInfo:nil repeats:YES];
    pageNum = scrollView.contentOffset.x/MAINSCREEN_BOUND.size.width;
    if (pageNum == self.imagePathArray.count + 1) {
        pageNum = 1;
    }else if (pageNum == 0) {
        pageNum = (int)self.imagePathArray.count + 1;
    } else {
        pageNum = scrollView.contentOffset.x/MAINSCREEN_BOUND.size.width;
    }
    if (scrollView.contentOffset.x/MAINSCREEN_BOUND.size.width == self.imagePathArray.count + 1) {
        scrollView.contentOffset = CGPointMake(MAINSCREEN_BOUND.size.width, 0);
    }
    if (scrollView.contentOffset.x == 0) {
        scrollView.contentOffset = CGPointMake(MAINSCREEN_BOUND.size.width * self.imagePathArray.count, 0);
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_timer invalidate];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
