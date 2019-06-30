//
//  MH_JSW_PickerView.h
//  MHPickerView
//
//  Created by Ji Shaowei on 2019/6/30.
//  Copyright © 2019 51vision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MH_JSW_ToolView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MH_JSW_PickerView : UIPickerView

@property (nonatomic, assign) BOOL needTag;
@property (nonatomic, assign) NSInteger showTag;
@property (nonatomic, strong) MH_JSW_ToolView *toolBar;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) void (^containerViewClickedBlock)(void);

@property (nonatomic, strong) NSDictionary<NSAttributedStringKey, id> *attributes;

- (void)showMOFSPickerViewWithDataArray:(NSArray<NSString *> *)array commitBlock:(void(^)(NSString *string))commitBlock cancelBlock:(void(^)(void))cancelBlock;

- (void)showMOFSPickerViewWithCustomDataArray:(NSArray *)array keyMapper:(NSString *)keyMapper commitBlock:(void(^)(id model))commitBlock cancelBlock:(void(^)(void))cancelBlock;

@end

@interface NSString (MH_JSW_PickerView)

@property (nonatomic, copy) NSString *mofs_key;
@property (nonatomic, assign) NSInteger mofs_int_key;

@end

NS_ASSUME_NONNULL_END
