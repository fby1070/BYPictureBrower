//
//  ViewController.m
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import "ViewController.h"
#import "BYDemoTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *highQualityImageArray;
@property (nonatomic, assign) CGPoint point;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.imageArray = @[@"http://ww2.sinaimg.cn/thumbnail/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",
                      @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                      @"http://ww2.sinaimg.cn/thumbnail/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                      @"http://ww2.sinaimg.cn/thumbnail/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                      @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                      @"http://ww1.sinaimg.cn/thumbnail/9be2329dgw1etlyb1yu49j20c82p6qc1.jpg"
                      ];
  
  self.highQualityImageArray = @[@"http://ww2.sinaimg.cn/bmiddle/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",
                                 @"http://ww2.sinaimg.cn/bmiddle/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                                 @"http://ww2.sinaimg.cn/bmiddle/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                                 @"http://ww2.sinaimg.cn/bmiddle/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                                 @"http://ww2.sinaimg.cn/bmiddle/642beb18gw1ep3629gfm0g206o050b2a.gif",
                                 @"http://ww1.sinaimg.cn/bmiddle/9be2329dgw1etlyb1yu49j20c82p6qc1.jpg"
                                 ];
  self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.tableView registerClass:[BYDemoTableViewCell class] forCellReuseIdentifier:@"BYDemoTableViewCell"];
  [self.view addSubview:self.tableView];
  
  
  //拖动
//  UIImageView *imageView = [[UIImageView alloc] init];
//  UIImage *image = [UIImage imageNamed:@"1"];
//  CGFloat h = (self.view.bounds.size.width / image.size.width) * image.size.height;
//  imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, h);
//  imageView.image = [UIImage imageNamed:@"1"];
//  imageView.userInteractionEnabled = YES;
//  [self.view addSubview:imageView];
//  self.point = imageView.center;
//  UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
//  [imageView addGestureRecognizer:panGestureRecognizer];

  
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  BYDemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BYDemoTableViewCell"];
//  cell.label.text = [NSString stringWithFormat:@"%ld", indexPath.row];
  [cell bindArray:self.imageArray];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  CGRect rectInTableView = [tableView rectForRowAtIndexPath:indexPath];
//  CGRect rect = [tableView convertRect:rectInTableView toView:[tableView superview]];
  CGRect rect = [tableView convertRect:rectInTableView toView:[UIApplication sharedApplication].keyWindow.maskView];
  NSLog(@"%@",NSStringFromCGRect(rect));
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
      [view setCenter:(CGPoint){self.point.x, self.point.y}];
    }];
  }
}
@end
