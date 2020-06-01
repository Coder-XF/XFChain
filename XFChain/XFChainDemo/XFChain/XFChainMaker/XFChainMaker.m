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


static NSString *keyText = @"text";
static NSString *keyFont = @"font";
static NSString *keyTextColor = @"textColor";
static NSString *keyTextAlignment = @"textAlignment";
static NSString *keyAttributedText = @"attributedText";
static NSString *keyNumberOfLines = @"numberOfLines";
//static NSString *keyFont = @"font";numberOfLines


- (TextBlock)xf_setTextBlock{
    return ^XFChainMaker* (NSString *text){
        
        [self.originalView setValue:text forKeyPath:keyText];
        return self;
    };
}

- (FontSizeBlock)xf_setFontSizeBlock{
    return ^XFChainMaker* (float font){
        [self.originalView setValue:[UIFont systemFontOfSize:font] forKeyPath:keyFont];
        return self;
    };
}

- (TextColorBlock)xf_setTextColorBlock{
    return ^XFChainMaker* (UIColor *color){
        [self.originalView setValue:color forKeyPath:keyTextColor];
        
        return  self;
    };
}

- (TextAlignmentBlock)xf_setTextAlignmentBlock{
    return ^XFChainMaker* (NSTextAlignment textAlignment){
        [self setTextAlignment:textAlignment];
        return self;
    };
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

- (AttributedTextBlock)xf_setAttributedTextBlock{
    return ^XFChainMaker* (NSAttributedString* attributedText){
        if(self.buttion){
            self.buttion.titleLabel.attributedText = attributedText;
        }else{
            [self.originalView setValue:attributedText forKeyPath:keyAttributedText];
        }
        return self;
    };
}

- (UserInteractionEnabledBlock)xf_setUserInteractionEnabledBlock{
    return ^XFChainMaker* (BOOL userInteractionEnabled){
        self.originalView.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}


- (NumberOfLinesBlock)xf_setNumberOfLinesBlock{
    return ^XFChainMaker* (NSInteger lines){
        if(self.label){
            UILabel *label = (UILabel*)self -> _originalView;
            label.numberOfLines = lines;
        }
        return self;
    };
}


- (BackGroundColorBlock)xf_setBackGroundColorBlock{
    return ^XFChainMaker* (UIColor* color){
        [self.originalView setValue:color forKeyPath:@"backgroundColor"];
        return self;
    };
}


#pragma mark - button

- (TitleWithSateBlock)xf_setTitleWithSateBlock{
    if(self.buttion){
        return ^XFChainMaker* (NSString* title, UIControlState state){
            [self.buttion setTitle:title forState:state];
            return self;
        };
    }
    return nil;
}

- (ImageWithSateBlock)xf_setImageWithSateBlock{
    if(self.buttion){
        return ^XFChainMaker* (UIImage* image, UIControlState state){
            [self.buttion setImage:image forState:state];
            return self;
        };
    }
    return nil;
}


- (BackGroundImageWithSateBlock)xf_setBackGroundImageWithSateBlock{
    if(self.buttion){
        return ^XFChainMaker* (UIImage* image, UIControlState state){
            [self.buttion setBackgroundImage:image forState:state];
            return self;
        };
    }
    return nil;
}

- (ContentEdgeInsetsBlock)xf_setContentEdgeInsetsBlock{
    if(self.buttion){
        return ^XFChainMaker* (UIEdgeInsets edgeInsets){
            self.buttion.contentEdgeInsets = edgeInsets;
            return self;
        };
    }
    return nil;
}

- (ImageEdgeInsetsBlock)xf_setImageEdgeInsetsBlock{
    if(self.buttion){
        return ^XFChainMaker* (UIEdgeInsets edgeInsets){
            self.buttion.imageEdgeInsets = edgeInsets;
            return self;
        };
    }
    return nil;
}

- (TitleEdgeInsetsBlock)xf_setTitleEdgeInsetsBlock{
    if(self.buttion){
        return ^XFChainMaker* (UIEdgeInsets edgeInsets){
            self.buttion.titleEdgeInsets = edgeInsets;
            return self;
        };
    }
    return nil;
}

- (TitleColorBlock)xf_setTitleColorBlock{
    if(self.buttion){
        return ^XFChainMaker* (UIColor *color, UIControlState state){
            [self.buttion setTitleColor:color forState:state];
            return self;
        };
    }
    return nil;
}

- (AttributedTitleBlock)xf_setAttributedTitleBlock{
    if(self.buttion){
        return ^XFChainMaker* (NSAttributedString *attributedString, UIControlState state){
            [self.buttion setAttributedTitle:attributedString forState:state];
            return self;
        };
    }
    return nil;
}

#pragma mark - textField

- (BorderStyleBlock)xf_setBorderStyleBlock{
    if(self.textField){
        return ^XFChainMaker* (UITextBorderStyle style){
            self.textField.borderStyle = style;
            return self;
        };
    }
    return nil;
}

- (PlaceholderBlock)xf_setPlaceholderBlock{
    if(self.textField){
        return ^XFChainMaker* (NSString *placeholder){
            self.textField.placeholder = placeholder;
            return self;
        };
    }
    return nil;
}

- (AttributedTitlePlaceholderBlock)xf_setAttributedTitlePlaceholderBlock{
    if(self.textField){
        return ^XFChainMaker* (NSAttributedString *attributedString){
            self.textField.attributedPlaceholder = attributedString;
            return self;
        };
    }
    return nil;
}

- (ClearsOnBeginEditing)xf_setClearsOnBeginEditing{
    if(self.textField){
        return ^XFChainMaker* (BOOL clearsOnBeginEditing){
            self.textField.clearsOnBeginEditing = clearsOnBeginEditing;
            return self;
        };
    }
    return nil;
}

- (TextFliedDelegate)xf_setTextFliedDelegate{
    if(self.textField){
        return ^XFChainMaker* (id<UITextFieldDelegate> delegate){
            self.textField.delegate = delegate;
            return self;
        };
    }
    return nil;
}

- (TextFliedBackgroundImage)xf_setTextFliedBackgroundImage{
    if(self.textField){
        return ^XFChainMaker* (UIImage *image){
            self.textField.background = image;
            return self;
        };
    }
    return nil;
}

- (TextFliedDisabledBackgroundImage)xf_setTextFliedDisabledBackgroundImage{
    if(self.textField){
        return ^XFChainMaker* (UIImage *image){
            self.textField.disabledBackground = image;
            return self;
        };
    }
    return nil;
}

- (TextFliedClearButtonMode)xf_setTextFliedClearButtonMode{
    if(self.textField){
        return ^XFChainMaker* (UITextFieldViewMode mode){
            self.textField.clearButtonMode = mode;
            return self;
        };
    }
    return nil;
}

- (TextFliedLeftView)xf_setTextFliedLeftView{
    if(self.textField){
        return ^XFChainMaker* (UIView *view){
            self.textField.leftView = view;
            return self;
        };
    }
    return nil;
}

- (TextFliedRightView)xf_setTextFliedRightView{
    if(self.textField){
        return ^XFChainMaker* (UIView *view){
            self.textField.rightView = view;
            return self;
        };
    }
    return nil;
}

#pragma mark - private



- (void)setOriginalView:(UIView *)originalView{
    
    _originalView = originalView;
    
    if ([_originalView isKindOfClass:UILabel.class]) {
        _label = (UILabel *)_originalView;
        _originalView = _label;
    }else if ([_originalView isKindOfClass:UIButton.class]){
        _buttion = (UIButton *)_originalView;
        _originalView = _buttion;
        keyText = @"titleLabel.text";
        keyFont = @"titleLabel.font";
        keyTextColor = @"titleLabel.textColor";
    }else if ([_originalView isKindOfClass:UITextField.class]){
        _textField = (UITextField *)_originalView;
        _originalView = _textField;
    }else if ([_originalView isKindOfClass:UITextView.class]){
        _textView = (UITextView *)_originalView;
        _originalView = _textView;
    }else if ([_originalView isKindOfClass:[UITableView class]]){
        _tableView = (UITableView *)_originalView;
        _originalView = _tableView;
    }
}


- (AddToSuperViewBlock)xf_addToSuperViewBlock{
    return ^XFChainMaker* (UIView *superView){
        [superView addSubview:self.originalView];
        return self;
    };
}



#pragma mark - frame

- (FrameBlock)xf_setFrame{
    return ^XFChainMaker* (CGRect frame){
        self.originalView.frame = frame;
        return self;
    };
}

- (BoundsBlock)xf_setBounds{
    return ^XFChainMaker* (CGRect bounds){
        self.originalView.bounds = bounds;
        return self;
    };
}

- (CenterBlock)xf_setCenter{
    return ^XFChainMaker* (CGPoint center){
        self.originalView.center = center;
        return self;
    };
}

#pragma mark -layer

- (XFChainMaker *(^)(CGFloat))cornerRadius{
    return ^(CGFloat cornerRadius){
        self.originalView.layer.cornerRadius = cornerRadius;
        return self;
    };
}
- (XFChainMaker *(^)(CGFloat))borderWidth{
    return ^(CGFloat borderWidth){
        self.originalView.layer.borderWidth = borderWidth;
        return self;
    };
}
- (XFChainMaker *(^)(CGColorRef))borderColor{
    return ^(CGColorRef borderColor){
        self.originalView.layer.borderColor = borderColor;
        return self;
    };
}



- (void)dealloc{
    NSLog(@"%s",__func__);
}



@end
