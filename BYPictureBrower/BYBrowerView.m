//
//  BYBrowerView.m
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import "BYBrowerView.h"
#import "BYAsset.h"

@interface BYBrowerView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray<NSString *> *imageArray;
@property (nonatomic, strong) NSArray<BYAsset *> *assetArray;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *imagesSuperView;
@end

@implementation BYBrowerView

- (instancetype)initWithImageArray:(NSArray *)imageArray imagesSuperView:(UIView *)imagesSuperView {
  self = [super init];
  if (self) {
    self.imagesSuperView = imagesSuperView;
    self.imageArray = imageArray;
    self.backgroundColor = [UIColor blackColor];
    self.alpha = 0;
    [self initSubviews];
  }
  return self;
}

- (void)initSubviews {
  UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
  layout.itemSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
  self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
  self.collectionView.scrollsToTop = NO;
  self.collectionView.showsVerticalScrollIndicator = NO;
  self.collectionView.showsHorizontalScrollIndicator = NO;
  self.collectionView.pagingEnabled = YES;
  [self addSubview:self.collectionView];
  // "1/6"
  
  //保存图片按钮
  
  //下面的点点点
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  return nil;
}

- (void)setImageArray:(NSArray<NSString *> *)imageArray {
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:imageArray.count];
  [imageArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    
  }];
}

- (void)show {
  UIWindow *window = [UIApplication sharedApplication].keyWindow;
  self.frame = window.bounds;
  [window addSubview:self];
  
//  CGRect rect = [self.baseView convertRect:self.baseView.bounds toView:window.maskView];
//
//  UIImageView *imageView = (UIImageView *)self.baseView;
//  UIImage *image = imageView.image;
//
//
//  UIImageView *newImageView = [[UIImageView alloc] init];
//  newImageView.frame = rect;
//  newImageView.image = image;
//  [self addSubview:newImageView];
//
//  CGFloat h = (self.bounds.size.width / image.size.width) * image.size.height;
//  CGFloat y = (self.frame.size.height - h) / 2;
//  CGRect newRect = CGRectMake(0, y, self.bounds.size.width, h);
//
  [UIView animateWithDuration:0.5 animations:^{
    self.alpha = 1;
//    newImageView.frame = newRect;
  }];
}
@end
