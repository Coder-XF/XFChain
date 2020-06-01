//
//  ViewController.m
//  XFChain
//
//  Created by 许飞 on 2020/5/28.
//  Copyright © 2020 CoderXF. All rights reserved.
//

#import "ViewController.h"
#import "UIView+XFViewChain.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [UILabel new];
    label.maker.xf_setFrame(CGRectMake(100, 100, 100, 20)).xf_setBackGroundColorBlock([UIColor greenColor]).xf_setFontSizeBlock(15).xf_setTextBlock(@"label").xf_setTextColorBlock([UIColor redColor]).xf_addToSuperViewBlock(self.view);
    
    UIButton *btn = [[UIButton alloc]init];
    btn.maker.xf_setFrame(CGRectMake(100, 200, 100, 20)).xf_addToSuperViewBlock(self.view).xf_setTitleWithSateBlock (@"button", UIControlStateNormal).xf_setTitleColorBlock([UIColor greenColor], UIControlStateNormal).xf_setBackGroundColorBlock([UIColor redColor]);
    
    UITextField *field = [[UITextField alloc]init];
    field.maker.xf_setFrame(CGRectMake(100, 300, 100, 20)).xf_setPlaceholderBlock(@"textField").xf_addToSuperViewBlock(self.view).xf_setClearsOnBeginEditing(YES).xf_setBackGroundColorBlock([UIColor yellowColor]);
    
}


@end
