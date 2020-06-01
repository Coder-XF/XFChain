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

typedef XFChainMaker* _Nullable (^FontSizeBlock)(float font);

typedef XFChainMaker* _Nonnull (^TextColorBlock)(UIColor* color);

typedef XFChainMaker* _Nonnull (^TextAlignmentBlock)(NSTextAlignment textAlignment);

typedef XFChainMaker* _Nonnull (^AttributedTextBlock)(NSAttributedString* attributedText);

typedef XFChainMaker* _Nonnull (^UserInteractionEnabledBlock)(BOOL userInteractionEnabled);

typedef XFChainMaker* _Nonnull (^NumberOfLinesBlock)(NSInteger lines);

// backgroundColor
typedef XFChainMaker* _Nonnull (^BackGroundColorBlock)(UIColor *color);

// 添加到父控件
typedef XFChainMaker* _Nonnull (^AddToSuperViewBlock)(UIView *view);

// button相关
typedef XFChainMaker* _Nonnull (^TitleWithSateBlock)(NSString *title, UIControlState state);

typedef XFChainMaker* _Nonnull (^ImageWithSateBlock)(UIImage *image, UIControlState state);

typedef XFChainMaker* _Nonnull (^BackGroundImageWithSateBlock)(UIImage *image, UIControlState state);

typedef XFChainMaker* _Nonnull (^ContentEdgeInsetsBlock)(UIEdgeInsets edgeInsets);

typedef XFChainMaker* _Nonnull (^TitleEdgeInsetsBlock)(UIEdgeInsets edgeInsets);

typedef XFChainMaker* _Nonnull (^ImageEdgeInsetsBlock)(UIEdgeInsets edgeInsets);

typedef XFChainMaker* _Nonnull (^TitleColorBlock)(UIColor *color, UIControlState state);

typedef XFChainMaker* _Nonnull (^AttributedTitleBlock)(NSAttributedString *attributedTitle, UIControlState state);

// textField
typedef XFChainMaker* _Nonnull (^BorderStyleBlock)(UITextBorderStyle style);

typedef XFChainMaker* _Nonnull (^PlaceholderBlock)(NSString *placeholder);

typedef XFChainMaker* _Nonnull (^AttributedTitlePlaceholderBlock)(NSAttributedString *attributedTitle);

typedef XFChainMaker* _Nonnull (^ClearsOnBeginEditing)(BOOL clearsOnBeginEditing);

typedef XFChainMaker* _Nonnull (^TextFliedDelegate)(id<UITextFieldDelegate> delegate);

typedef XFChainMaker* _Nonnull (^TextFliedBackgroundImage)(UIImage *image);

typedef XFChainMaker* _Nonnull (^TextFliedDisabledBackgroundImage)(UIImage *image);

typedef XFChainMaker* _Nonnull (^TextFliedClearButtonMode)(UITextFieldViewMode mode);

typedef XFChainMaker* _Nonnull (^TextFliedLeftView)(UIView *view);

typedef XFChainMaker* _Nonnull (^TextFliedRightView)(UIView *view);



// frame
typedef XFChainMaker* _Nonnull (^FrameBlock)(CGRect frame);
// bounds
typedef XFChainMaker* _Nonnull (^BoundsBlock)(CGRect bounds);
// center
typedef XFChainMaker* _Nonnull (^CenterBlock)(CGPoint center);

@interface XFChainMaker : NSObject

@property(nonatomic, copy) TextBlock xf_setTextBlock;

@property(nonatomic, copy) FontSizeBlock xf_setFontSizeBlock;

@property(nonatomic, copy) TextColorBlock xf_setTextColorBlock;

@property(nonatomic, copy) TextAlignmentBlock xf_setTextAlignmentBlock;

@property(nonatomic, copy) AttributedTextBlock xf_setAttributedTextBlock;

@property(nonatomic, copy) UserInteractionEnabledBlock xf_setUserInteractionEnabledBlock;

@property(nonatomic, copy) NumberOfLinesBlock xf_setNumberOfLinesBlock;

@property(nonatomic, copy) BackGroundColorBlock xf_setBackGroundColorBlock;

@property(nonatomic, copy) AddToSuperViewBlock xf_addToSuperViewBlock;

// button
@property(nonatomic, copy) TitleWithSateBlock xf_setTitleWithSateBlock;

@property(nonatomic, copy) ImageWithSateBlock xf_setImageWithSateBlock;

@property(nonatomic, copy) BackGroundImageWithSateBlock xf_setBackGroundImageWithSateBlock;

@property(nonatomic, copy) ContentEdgeInsetsBlock xf_setContentEdgeInsetsBlock;

@property(nonatomic, copy) ImageEdgeInsetsBlock xf_setImageEdgeInsetsBlock;

@property(nonatomic, copy) TitleEdgeInsetsBlock xf_setTitleEdgeInsetsBlock;

@property(nonatomic, copy) TitleColorBlock xf_setTitleColorBlock;

@property(nonatomic, copy) AttributedTitleBlock xf_setAttributedTitleBlock;

// textField
@property(nonatomic, copy) BorderStyleBlock xf_setBorderStyleBlock;

@property(nonatomic, copy) PlaceholderBlock xf_setPlaceholderBlock;

@property(nonatomic, copy) AttributedTitlePlaceholderBlock xf_setAttributedTitlePlaceholderBlock;

@property(nonatomic, copy) ClearsOnBeginEditing xf_setClearsOnBeginEditing;

@property(nonatomic, copy) TextFliedDelegate xf_setTextFliedDelegate;

@property(nonatomic, copy) TextFliedBackgroundImage xf_setTextFliedBackgroundImage;

@property(nonatomic, copy) TextFliedDisabledBackgroundImage xf_setTextFliedDisabledBackgroundImage;

@property(nonatomic, copy) TextFliedClearButtonMode xf_setTextFliedClearButtonMode;

@property(nonatomic, copy) TextFliedLeftView xf_setTextFliedLeftView;

@property(nonatomic, copy) TextFliedRightView xf_setTextFliedRightView;


@property(nonatomic, copy) FrameBlock xf_setFrame;

@property(nonatomic, copy) BoundsBlock xf_setBounds;

@property(nonatomic, copy) CenterBlock xf_setCenter;


@property(nonatomic, weak) UIView *originalView;


- (XFChainMaker *(^)(CGFloat))cornerRadius;

- (XFChainMaker *(^)(CGFloat))borderWidth;

- (XFChainMaker *(^)(CGColorRef))borderColor;

@end

NS_ASSUME_NONNULL_END
