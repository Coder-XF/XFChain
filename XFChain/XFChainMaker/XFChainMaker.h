//
//  XFChainMaker.h
//  XFChain
//
//  Created by 许飞 on 2020/5/28.
//  Copyright © 2020 CoderXF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@class XFChainMaker;

/*  定义block */
/// UILabel
typedef XFChainMaker*_Nonnull (^TextBlock)(NSString* text);

typedef XFChainMaker* _Nullable (^FontSizeBlock)(float* font);

typedef XFChainMaker* _Nonnull (^TextColorBlock)(UIColor* color);

typedef XFChainMaker* _Nonnull (^TextAlignmentBlock)(NSTextAlignment textAlignment);

typedef XFChainMaker* _Nonnull (^AttributedTextBlock)(NSAttributedString* attributedText);

typedef XFChainMaker* _Nonnull (^UserInteractionEnabledBlock)(BOOL userInteractionEnabled);

typedef XFChainMaker* _Nonnull (^NumberOfLinesBlock)(NSInteger lines);

@interface XFChainMaker : NSObject

@property(nonatomic, copy) TextBlock xf_setTextBlock;

@property(nonatomic, copy) FontSizeBlock xf_setFontSizeBlock;

@property(nonatomic, copy) TextColorBlock xf_setTextColorBlock;

@property(nonatomic, copy) TextAlignmentBlock xf_setTextAlignmentBlock;

@property(nonatomic, copy) AttributedTextBlock xf_setAttributedTextBlock;

@property(nonatomic, copy) UserInteractionEnabledBlock xf_setUserInteractionEnabledBlock;

@property(nonatomic, copy) NumberOfLinesBlock xf_setNumberOfLinesBlock;


@property(nonatomic, weak) UIView *originalView;


- (XFChainMaker *(^)(NSString *)) text;     // default is nil

- (XFChainMaker *(^)(float)) font;  // default is nil (system font 17 plain)

- (XFChainMaker *(^)(UIColor *)) textColor;   // default is nil (text draws black)

- (XFChainMaker *(^)(uint32_t)) textColorColorWithRgbValue;   // default is nil (text draws black)

- (XFChainMaker *(^)(NSTextAlignment)) textAlignment;   // default is NSTextAlignmentNatural (before iOS 9, the default was NSTextAlignmentLeft)

- (XFChainMaker *(^)(NSLineBreakMode)) lineBreakMode;  // default is NSLineBreakByTruncatingTail. used for single and multiple lines of text

// the underlying attributed string drawn by the label, if set, the label ignores the properties above.
- (XFChainMaker *(^)(NSAttributedString *)) attributedText NS_AVAILABLE_IOS(6_0);  // default is nil

- (XFChainMaker *(^)(BOOL)) userInteractionEnabled;  // default is NO

- (XFChainMaker *(^)(BOOL)) enabled;  // default is YES. changes how the label is drawn

// this determines the number of lines to draw and what to do when sizeToFit is called. default value is 1 (single line). A value of 0 means no limit
// if the height of the text reaches the # of lines or the height of the view is less than the # of lines allowed, the text will be
// truncated using the line break mode.
- (XFChainMaker *(^)(NSInteger)) numberOfLines;  // default is YES. changes how the label is drawn


// these next 3 properties allow the label to be autosized to fit a certain width by scaling the font size(s) by a scaling factor >= the minimum scaling factor
// and to specify how the text baseline moves when it needs to shrink the font.
- (XFChainMaker *(^)(BOOL)) adjustsFontSizeToFitWidth;        // default is NO

- (XFChainMaker *(^)(UIBaselineAdjustment)) baselineAdjustment;         // default is UIBaselineAdjustmentAlignBaselines

#pragma mark - UIButton

- (XFChainMaker *(^)(NSString *,UIControlState)) title;  // default is nil. title is assumed to be single line

- (XFChainMaker *(^)(UIColor *,UIControlState)) titleColor UI_APPEARANCE_SELECTOR;   // default if nil. use opaque white

- (XFChainMaker *(^)(uint32_t, UIControlState)) titleColorWithRgbValue UI_APPEARANCE_SELECTOR;   // default if nil. use opaque white

- (XFChainMaker *(^)(UIImage *,UIControlState)) image; // default is nil. should be same size if different for different states

- (XFChainMaker *(^)(UIImage *,UIControlState)) backgroundImage UI_APPEARANCE_SELECTOR; // default is nil

- (XFChainMaker *(^)(NSAttributedString *,UIControlState)) attributedTitle NS_AVAILABLE_IOS(6_0); // default is nil. title is assumed to be single line

- (XFChainMaker *(^)(UIEdgeInsets)) contentEdgeInsets UI_APPEARANCE_SELECTOR; // default is UIEdgeInsetsZero. On tvOS 10 or later, default is nonzero except for custom buttons.

- (XFChainMaker *(^)(UIEdgeInsets)) titleEdgeInsets;     // default is UIEdgeInsetsZero

- (XFChainMaker *(^)(UIEdgeInsets)) imageEdgeInsets;     // default is UIEdgeInsetsZero

- (XFChainMaker *(^)(UIView *))addToSuperView;

- (XFChainMaker *(^)(CGRect))frame;

- (XFChainMaker *(^)(CGRect))bounds;

- (XFChainMaker *(^)(CGPoint))center;


@end

NS_ASSUME_NONNULL_END
