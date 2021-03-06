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

#define kBYWidth (kScreenWidth + 20)

@interface BYBrowerView ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
UIScrollViewDelegate,
BYBrowerCellDelegate>

@property (nonatomic, strong) NSArray<BYAsset *> *assetArray;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger selectedIndex;
@end

@implementation BYBrowerView

- (instancetype)initWithImageViewArray:(NSArray<UIImageView *> *)imageViewArray {
  self = [super init];
  if (self) {
    self.assetArray = [self dataFormat:imageViewArray];
    self.backgroundColor = [UIColor blackColor];
    self.alpha = 0;
    [self initSubviews];
  }
  return self;
}

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
  
  // "1/6"
  
  //保存图片按钮
  
  //下面的点点点
}

- (void)layoutSubviews {
  [super layoutSubviews];
  self.collectionView.frame = CGRectMake(0, 0, self.bounds.size.width + 20, self.bounds.size.height);
  self.collectionView.contentOffset = CGPointMake(self.selectedIndex * kBYWidth, 0);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.assetArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(kBYWidth, kScreenHeight);
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

- (void)showWithIndex:(NSUInteger)index {
  UIWindow *window = [UIApplication sharedApplication].keyWindow;
  self.frame = window.bounds;
  [window addSubview:self];
  self.selectedIndex = index;
  self.collectionView.hidden = YES;
  BYAsset *selectedAsset = [self.assetArray objectOrNilAtIndex:index];
  CGRect currentRect = CGRectZero;
  
  UIImageView *currentImageView = [[UIImageView alloc] init];
  if (selectedAsset) {
    currentRect = selectedAsset.rect;
    currentImageView.frame = currentRect;
    currentImageView.image = selectedAsset.normalImage.image;
    currentImageView.contentMode = selectedAsset.defaultImageView.contentMode;
    [self addSubview:currentImageView];
    CGFloat h = (self.bounds.size.width / selectedAsset.normalImage.image.size.width) * selectedAsset.normalImage.image.size.height;
    CGFloat y = (self.frame.size.height - h) / 2;
    CGRect newRect = CGRectMake(0, y, self.bounds.size.width, h);
    
    [UIView animateWithDuration:0.2 animations:^{
      self.alpha = 1;
      currentImageView.frame = newRect;
    } completion:^(BOOL finished) {
      self.collectionView.hidden = NO;
      currentImageView.hidden = YES;
    }];
  } else {
    
  }
}
- (void)dismissWithRect:(CGRect)rect cell:(BYBrowerCell *)cell {
  [self dismissAnimationWithRect:rect cell:cell];
}

- (void)dismissAnimationWithRect:(CGRect)rect cell:(BYBrowerCell *)cell {
  NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
  NSInteger index = indexPath.row;
  
  BYAsset *asset = [self.assetArray objectOrNilAtIndex:index];
  if (asset.defaultImageView) {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.image = asset.defaultImageView.image;
    [self addSubview:imageView];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect defaultRect = [asset.defaultImageView convertRect:asset.defaultImageView.bounds toView:window.maskView];
    self.collectionView.hidden = YES;
    [UIView animateWithDuration:0.4 animations:^{
      self.backgroundColor = [UIColor clearColor];
      imageView.frame = defaultRect;
    } completion:^(BOOL finished) {
      imageView.hidden = YES;
      [self removeFromSuperview];
    }];
  }
}

- (NSArray<BYAsset *> *)dataFormat:(NSArray<UIImageView *> *)imageViewArray {
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:imageViewArray.count];
  UIWindow *window = [UIApplication sharedApplication].keyWindow;
  [imageViewArray enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    BYAsset *asset = [[BYAsset alloc] init];
    CGRect rect = [obj convertRect:obj.bounds toView:window.maskView];
    asset.defaultImageView = obj;
    asset.rect = rect;
    BYPicture *pic = [[BYPicture alloc] init];

    pic.image = obj.image;
    pic.width = kScreenWidth;
    CGFloat h = (kScreenWidth / obj.image.size.width) * obj.image.size.height;
    pic.height = h;
    asset.normalImage = pic;
    [array addObject:asset];
  }];
  return [array copy];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  NSInteger index = (NSInteger)scrollView.contentOffset.x / (NSInteger)[UIScreen mainScreen].bounds.size.width;
  BYBrowerCell *cell = (BYBrowerCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
  [cell setupGesture];
}
@end
