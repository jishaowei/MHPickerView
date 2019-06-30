//
//  MH_JSW_DatePicker.h
//  MHPickerView
//
//  Created by Ji Shaowei on 2019/6/30.
//  Copyright © 2019 51vision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MH_JSW_ToolView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^CommitBlock)(NSDate *date);
typedef void (^CancelBlock)(void);

@interface MH_JSW_DatePicker : UIDatePicker

@property (nonatomic, strong) MH_JSW_ToolView *toolBar;
@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) void (^containerViewClickedBlock)(void);

- (void)showMOFSDatePickerViewWithFirstDate:(NSDate *)date commit:(CommitBlock)commitBlock cancel:(CancelBlock)cancelBlock;

- (void)showMOFSDatePickerViewWithTag:(NSInteger)tag firstDate:(NSDate *)date commit:(CommitBlock)commitBlock cancel:(CancelBlock)cancelBlock;

@end

NS_ASSUME_NONNULL_END
