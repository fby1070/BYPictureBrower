
#import "SSModel.h"

@interface Picture : SSModel

/**
 * 图片链接
 * version: 0.1
 * modify: 2018/06/11
 */
@property(nonatomic, copy) NSString *imageUrl;

/**
 * 图片的宽
 * version: 0.1
 * modify: 2018/06/11
 */
@property(nonatomic, assign) NSInteger width;

/**
 * 图片的高
 * version: 0.1
 * modify: 2018/06/11
 */
@property(nonatomic, assign) NSInteger height;

/**
 * 图片字节数
 * version: 0.1
 * modify: 2018/06/11
 */
@property(nonatomic, copy) NSString *size;
@end
