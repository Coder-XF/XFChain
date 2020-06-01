//
//  XFChainMaker.m
//  XFChain
//
//  Created by 许飞 on 2020/5/28.
//  Copyright © 2020 CoderXF. All rights reserved.
//

#import "XFChainMaker.h"

@interface XFChainMaker ()
@property (nonatomic,   weak) UILabel *label;
@property (nonatomic,   weak) UIButton *buttion;
@property (nonatomic,   weak) UITextField *textField;
@property (nonatomic,   weak) UITextView *textView;
@property (nonatomic,   weak) UIImageView *imageView;

@property (nonatomic,   weak) UITableView *tableView;

@end

@implementation XFChainMaker

- (TextBlock)xf_setTextBlock{
    return ^XFChainMaker* (NSString *text){
        [self.originalView setValue:text forKeyPath:@"text"];
        return self;
    };
}

- (FontSizeBlock)xf_setFontSizeBlock{
    return ^XFChainMaker* (float font){
        [self.originalView setValue:[UIFont systemFontOfSize:font] forKeyPath:@"font"];
        return self;
    };
}



- (XFChainMaker *(^)(NSString *)) text{
    return ^(NSString *text){
        [self setText:text];
        return self;
    };
}

- (XFChainMaker *(^)(float)) font{
    return ^(float font){
        [self setFont:font];
        return self;
    };
}

- (XFChainMaker *(^)(UIColor *)) textColor{
    return ^(UIColor * textColor){
        [self setTextColor:textColor];
        return self;
    };
}


- (XFChainMaker *(^)(BOOL)) userInteractionEnabled{
    return ^(BOOL userInteractionEnabled){
        [self setUserInteractionEnabled:userInteractionEnabled];
        return  self;
    };
}

- (XFChainMaker *(^)(BOOL)) enabled{
    return ^(BOOL enabled){
        [self setEnabled:enabled];
        return self;
    };
}


#pragma mark - UIButton

- (XFChainMaker *(^)(NSString *,UIControlState)) title{
    return ^(NSString* title, UIControlState state){
        [self.buttion setTitle:title forState:state];
        return self;
    };
}



- (XFChainMaker *(^)(UIImage *,UIControlState)) image{
    return ^(UIImage* image, UIControlState state){
        [self.buttion setImage:image forState:state];
        return self;
    };
}



#pragma mark- private
- (void)setText:(NSString * )text{
    if (self.label) {
        self.label.text = text;
    }else if (self.textField) {
        self.textField.text = text;
    }else if (self.textView){
        self.textView.text = text;
    }
}
- (void)setFont:(float)font{
    if (self.label) {
        self.label.font = [UIFont systemFontOfSize:font];
    }else if (self.textField) {
        self.textField.font = [UIFont systemFontOfSize:font];
    }else if (self.buttion){
        self.buttion.titleLabel.font = [UIFont systemFontOfSize:font];
    }else if (self.textView){
        self.textView.font = [UIFont systemFontOfSize:font];
    }
}
- (void)setTextColor:(UIColor *)textColor{
    if (self.label) {
        self.label.textColor = textColor;
    }else if (self.textField) {
        self.textField.textColor = textColor;
    }else if (self.textView){
        self.textView.textColor = textColor;
    }
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment{
    if (self.label) {
        self.label.textAlignment = textAlignment;
    }else if (self.buttion){
        self.buttion.titleLabel.textAlignment = textAlignment;
    }else if (self.textField){
        self.textField.textAlignment = textAlignment;
    }else if (self.textView){
        self.textView.textAlignment = textAlignment;
    }
}
- (void)setAttributedText:(NSAttributedString *)attributedText{
    if (self.label) {
        self.label.attributedText = attributedText;
    }else if (self.textField){
        self.textField.attributedText = attributedText;
    }else if (self.textView){
        self.textView.attributedText = attributedText;
    }
}
- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled{
    if (self.originalView) {
        self.originalView.userInteractionEnabled = userInteractionEnabled;
    }
}
- (void)setEnabled:(BOOL)enabled{
    if (self.label) {
        self.label.enabled = enabled;
    }else if (self.buttion){
        self.buttion.enabled = enabled;
    }else if (self.textField){
        self.textField.enabled = enabled;
    }
}

- (void)setOriginalView:(UIView *)originalView{
    
    _originalView = originalView;
    
    if ([_originalView isKindOfClass:UILabel.class]) {
        _label = (UILabel *)_originalView;
    }else if ([_originalView isKindOfClass:UIButton.class]){
        _buttion = (UIButton *)_originalView;
    }else if ([_originalView isKindOfClass:UITextField.class]){
        _textField = (UITextField *)_originalView;
    }else if ([_originalView isKindOfClass:UITextView.class]){
        _textView = (UITextView *)_originalView;
    }else if ([_originalView isKindOfClass:[UITableView class]]){
        _tableView = (UITableView *)_originalView;
    }
    
}

- (XFChainMaker *(^)(UIView *))addToSuperView{
    return ^(UIView *superView){
        [superView addSubview:self.originalView];
        return self;
    };
}

#pragma mark - frame

- (XFChainMaker *(^)(CGRect))frame{
    return ^(CGRect frame){
        self.originalView.frame = frame;
        return self;
    };
}
- (XFChainMaker *(^)(CGRect))bounds{
    return ^(CGRect bounds){
        self.originalView.bounds = bounds;
        return self;
    };
}
- (XFChainMaker *(^)(CGPoint))center{
    return ^(CGPoint center){
        self.originalView.center = center;
        return self;
    };
}


- (void)dealloc{
    NSLog(@"%s",__func__);
}



@end
