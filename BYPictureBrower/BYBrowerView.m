//
//  BYBrowerView.m
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import "BYBrowerView.h"
#import "BYAsset.h"
#import "BYBrowerCell.h"
#import <YYKit/YYKit.h>

@interface BYBrowerView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate, BYBrowerCellDelegate>

@property (nonatomic, strong) NSArray<BYAsset *> *assetArray;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation BYBrowerView

- (instancetype)initWithAssetArray:(NSArray<BYAsset *> *)assetArray {
  self = [super init];
  if (self) {
    self.assetArray = assetArray;
    self.backgroundColor = [UIColor blackColor];
    self.alpha = 0;
    [self initSubviews];
  }
  return self;
}

- (void)initSubviews {
  UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
  layout.itemSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
  layout.minimumLineSpacing = 0;
  layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
  self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
  if (@available(iOS 11.0, *)) {
    self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
  }
  self.collectionView.scrollsToTop = NO;
  self.collectionView.showsVerticalScrollIndicator = NO;
  self.collectionView.showsHorizontalScrollIndicator = NO;
  self.collectionView.pagingEnabled = YES;
  self.collectionView.delegate = self;
  self.collectionView.dataSource = self;
  [self.collectionView registerClass:[BYBrowerCell class] forCellWithReuseIdentifier:@"BYBrowerCell"];
  [self addSubview:self.collectionView];
  
//  UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
//  singleTap.delegate = self;
//  UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
//  doubleTap.delegate = self;
//  doubleTap.numberOfTapsRequired = 2;
//  UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress)];
//  longPress.delegate = self;
//  [singleTap requireGestureRecognizerToFail: doubleTap];
//  [self addGestureRecognizer:singleTap];
//  [self addGestureRecognizer:doubleTap];
//  [self addGestureRecognizer:longPress];
  
  // "1/6"
  
  //保存图片按钮
  
  //下面的点点点
}

- (void)layoutSubviews {
  [super layoutSubviews];
  self.collectionView.frame = CGRectMake(0, 0, self.bounds.size.width + 20, self.bounds.size.height);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.assetArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(kScreenWidth + 20, kScreenHeight);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  BYBrowerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BYBrowerCell" forIndexPath:indexPath];
  cell.delegate = self;
  BYAsset *asset = self.assetArray[indexPath.row];
  [cell bindAsset:asset];
  return cell;
}

- (void)dismiss {
  [self removeFromSuperview];
}

#pragma mark - TapGesture Action

- (void)doubleTap:(UITapGestureRecognizer *)tapGestureRecognizer {

}


- (void)show {
  UIWindow *window = [UIApplication sharedApplication].keyWindow;
  self.frame = window.bounds;
  [window addSubview:self];
  [self.collectionView reloadData];
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

- (void)pictureOneClick:(UITapGestureRecognizer *)recognizer {
  [self dismiss];
}
@end
