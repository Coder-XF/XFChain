//
//  UIView+XFViewChain.m
//  XFChain
//
//  Created by 许飞 on 2020/5/28.
//  Copyright © 2020 CoderXF. All rights reserved.
//

#import "UIView+XFViewChain.h"
#import <objc/runtime.h>

@implementation UIView (XFViewChain)

// 类似于Masonry的用法
- (void)xf_makeChains:(void(^)(XFChainMaker *maker))block{
    XFChainMaker *maker = [[XFChainMaker alloc]init];
    maker.originalView = self;
    block(maker);
}

// 利用runloop创建关联对象，给UIView引入一个Maker属性，通过Maker对象实现对具体UI控件的链式设置属性
- (XFChainMaker *)ownMaker{
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setOwnMaker:(XFChainMaker *)ownMaker{
    objc_setAssociatedObject(self, @selector(ownMaker), ownMaker, OBJC_ASSOCIATION_RETAIN);
    
}

- (XFChainMaker*)maker{
    XFChainMaker *maker = [self ownMaker];
    if(!maker){
        maker = [[XFChainMaker alloc]init];
        maker.originalView = self;
        [self setOwnMaker:maker];
    }
    return maker;
}
@end
