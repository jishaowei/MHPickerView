//
//  MHMultipleSelectionPickerView.h
//  MHPickerView
//
//  Created by Ji Shaowei on 2019/6/27.
//  Copyright © 2019 51vision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MOFSToolView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MHMultipleSelectionPickerView : UITableView

@property (nonatomic, assign) BOOL needTag;
@property (nonatomic, assign) NSInteger showTag;
@property (nonatomic, strong) MOFSToolView *toolBar;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) void (^containerViewClickedBlock)(void);
@property (nonatomic, strong) NSDictionary<NSAttributedStringKey, id> *attributes;

- (void)showMHMultipleSelectedPickerViewWithDataArray:(NSArray<NSString *> *)array commitBlock:(void(^)(NSArray * containArray))commitBlock cancelBlock:(void(^)(void))cancelBlock;


@end

@interface MultipleSelectionModel : NSObject

@property (nonatomic , assign)BOOL cellSelected;
@property (nonatomic , copy)NSString * containString;

@end

@interface NSString (MHMultipleSelectionPickerView)

@property (nonatomic, copy) NSString *mufs_key;
@property (nonatomic, assign) NSInteger mufs_int_key;

@end

NS_ASSUME_NONNULL_END
