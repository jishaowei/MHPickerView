//
//  MHMultipleSpecialSelectionPickerView.h
//  MHPickerView
//
//  Created by Ji Shaowei on 2019/7/11.
//  Copyright © 2019 51vision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MH_JSW_ToolView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MHMultipleSpecialSelectionPickerView : UITableView

@property (nonatomic, assign) BOOL needTag;
@property (nonatomic, assign) NSInteger showTag;
@property (nonatomic, strong) MH_JSW_ToolView *toolBar;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) void (^containerViewClickedBlock)(void);
@property (nonatomic, strong) NSDictionary<NSAttributedStringKey, id> *attributes;

- (void)showMHMultipleSpecialSelectedPickerViewWithDataArray:(NSArray<NSString *> *)array specialContain:(NSString *)specialName commitBlock:(void(^)(NSArray * containArray))commitBlock cancelBlock:(void(^)(void))cancelBlock;

@end

@interface MultipleSpecialSelectionModel : NSObject

@property (nonatomic , assign)BOOL cellSelected;
@property (nonatomic , copy)NSString * containString;

@end

@interface NSString (MHMultipleSpecialSelectionPickerView)

@property (nonatomic, copy) NSString *musfs_key;
@property (nonatomic, assign) NSInteger musfs_int_key;

@end

NS_ASSUME_NONNULL_END
