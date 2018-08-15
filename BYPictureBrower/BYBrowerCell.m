//
//  BYBrowerCell.m
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import "BYBrowerCell.h"
#import <YYKit/YYKit.h>
#import "BYAsset.h"

@interface BYBrowerCell ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImageView *pictureView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) CGPoint point;
@property (nonatomic, assign) CGPoint beginPoint;
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation BYBrowerCell

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    [self initSubviews];
  }
  return self;
}

- (void)initSubviews {
  self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
  self.scrollView.maximumZoomScale = 2.0;
  self.scrollView.minimumZoomScale = 1.0;
  self.scrollView.delegate = self;
  [self addSubview:_scrollView];
  self.point = self.scrollView.center;
  
  self.pictureView = [[UIImageView alloc] init];
  [self.scrollView addSubview:self.pictureView];
  
  UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
  doubleTap.numberOfTapsRequired = 2;
  [self.scrollView addGestureRecognizer:doubleTap];
  
  UITapGestureRecognizer *oneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTap:)];
  [self.scrollView addGestureRecognizer:oneTap];
  [oneTap requireGestureRecognizerToFail:doubleTap];
  
  self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
  self.panGestureRecognizer.delegate = self;
  [self.scrollView addGestureRecognizer:self.panGestureRecognizer];
}

- (void)doubleTap:(UITapGestureRecognizer *)recognizer {
  if (self.scrollView.zoomScale > 1.0) {
    [self.scrollView setZoomScale:1.0 animated:YES];
  } else {
    CGPoint touchPoint = [recognizer locationInView:self.pictureView];
    CGFloat scale = self.scrollView.maximumZoomScale;
    CGRect newRect = [self getRectWithScale:scale andCenter:touchPoint];
    [self.scrollView zoomToRect:newRect animated:YES];
  }
}

- (void)oneTap:(UITapGestureRecognizer *)recognizer {
  if (self.delegate && [self.delegate respondsToSelector:@selector(pictureOneClick:)]) {
    [self.delegate pictureOneClick:recognizer];
  }
}

/** 计算点击点所在区域frame */
- (CGRect)getRectWithScale:(CGFloat)scale andCenter:(CGPoint)center{
  CGRect newRect = CGRectZero;
  newRect.size.width =  _scrollView.frame.size.width/scale;
  newRect.size.height = _scrollView.frame.size.height/scale;
  newRect.origin.x = center.x - newRect.size.width * 0.5;
  newRect.origin.y = center.y - newRect.size.height * 0.5;
  
  return newRect;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
  return self.pictureView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
  UIView *subView = self.pictureView;
  CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
  (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
  CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
  (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
  subView.center = CGPointMake((scrollView.contentSize.width - 20) * 0.5 + offsetX,
                               scrollView.contentSize.height * 0.5 + offsetY);
}

- (void)bindAsset:(BYAsset *)asset {
  [self.scrollView setZoomScale:1 animated:NO];
  
  //显示主要以中图为主，若存在中图，normalImage只能当placeHolder
  if (asset.mediumImage) {
    CGFloat y = (self.bounds.size.height - asset.mediumImage.height) / 2;
    if (asset.mediumImage.image) {
      self.pictureView.frame = CGRectMake(0, y, asset.mediumImage.width, asset.mediumImage.height);
      self.pictureView.image = asset.mediumImage.image;
    } else if (asset.mediumImage.imageUrl.isNotBlank) {
      __weak typeof(self) weakSelf = self;
      [self.pictureView setImageWithURL:[NSURL URLWithString:asset.mediumImage.imageUrl] placeholder:asset.normalImage.image options:YYWebImageOptionProgressiveBlur completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        if (error) {
          //提示图片下载错误
          return;
        }
        if (stage == YYWebImageStageFinished) {
          __strong typeof(weakSelf) strongSelf = weakSelf;
          if (strongSelf) {
            strongSelf.pictureView.image = image;
            strongSelf.pictureView.frame = CGRectMake(0, y, image.size.width, image.size.height);
          }
        }
      }];
    }
  } else {
    if (!asset.normalImage.image)return;
    self.pictureView.image = asset.normalImage.image;
    CGFloat y = (self.bounds.size.height - asset.normalImage.height) / 2;
    self.pictureView.frame = CGRectMake(0, y, asset.normalImage.width, asset.normalImage.height);
  }
  CGSize scrollViewSize = CGSizeMake(self.pictureView.frame.size.width, self.pictureView.frame.size.height);
  self.scrollView.contentSize = scrollViewSize;

}

- (void) panView:(UIPanGestureRecognizer *)panGestureRecognizer {
  UIView *view = panGestureRecognizer.view;
  if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged){
    CGPoint translation = [panGestureRecognizer translationInView:view.superview];
    [view setCenter:(CGPoint){view.center.x + translation.x, view.center.y + translation.y}];
    [panGestureRecognizer setTranslation:CGPointZero inView:view.superview];
  }
  if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
    [UIView animateWithDuration:0.3 animations:^{
      [view setCenter:(CGPoint){self.point.x, self.point.y} ];

    }];
  }
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
  if (gestureRecognizer) {
    //记录刚接触时的坐标
    self.beginPoint = [touch locationInView:self.window];
  }
  return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
  //判断是否是左右滑动  滑动区间设置为+-10
  CGPoint touchPoint = [gestureRecognizer locationInView:self.window];
  CGFloat dirTop = self.beginPoint.y - touchPoint.y;
  if (dirTop > -10 && dirTop < 10) {
    self.scrollView.panGestureRecognizer.enabled = YES;
    self.panGestureRecognizer.enabled = NO;
    return NO;
  } else {
    return YES;
  }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  self.panGestureRecognizer.enabled = YES;
}
- (void)setupGesture {
  self.panGestureRecognizer.enabled = YES;
}
@end
