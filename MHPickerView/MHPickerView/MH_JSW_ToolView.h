//
//  MH_JSW_ToolView.h
//  MHPickerView
//
//  Created by Ji Shaowei on 2019/6/30.
//  Copyright © 2019 51vision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MH_JSW_ToolView : UIView

@property (nonatomic, strong) UILabel *cancelBar;
@property (nonatomic, strong) UILabel *commitBar;
@property (nonatomic, strong) UILabel *titleBar;

/**
 default Title: "取消"
 */
@property (nonatomic, strong) NSString *cancelBarTitle;

/**
 default Color: [UIColor colorWithRed:0.090  green:0.463  blue:0.906 alpha:1]
 */
@property (nonatomic, strong) UIColor *cancelBarTintColor;

/**
 default Title: "完成"
 */
@property (nonatomic, strong) NSString *commitBarTitle;

/**
 default Color: [UIColor colorWithRed:0.090  green:0.463  blue:0.906 alpha:1]
 */
@property (nonatomic, strong) UIColor *commitBarTintColor;

/**
 default Title: ""
 */
@property (nonatomic, strong) NSString *titleBarTitle;

/**
 default Color: [UIColor colorWithRed:0.804  green:0.804  blue:0.804 alpha:1]
 */
@property (nonatomic, strong) UIColor *titleBarTextColor;

@property (nonatomic, strong) void (^cancelBlock)(void);
@property (nonatomic, strong) void (^commitBlock)(void);

@end

NS_ASSUME_NONNULL_END
