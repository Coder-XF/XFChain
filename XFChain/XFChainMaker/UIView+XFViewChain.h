//
//  UIView+XFViewChain.h
//  XFChain
//
//  Created by 许飞 on 2020/5/28.
//  Copyright © 2020 CoderXF. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "XFChainMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (XFViewChain)

@property(nonatomic, weak) XFChainMaker *ownMaker;
// 类似于Masonry框架的用法
- (void)xf_makeChains:(void(^)(XFChainMaker *maker))block;
@end

NS_ASSUME_NONNULL_END
