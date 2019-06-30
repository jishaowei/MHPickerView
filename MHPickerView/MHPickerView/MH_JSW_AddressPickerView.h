//
//  MH_JSW_AddressPickerView.h
//  MHPickerView
//
//  Created by Ji Shaowei on 2019/6/30.
//  Copyright © 2019 51vision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MH_JSW_ToolView.h"
#import "MH_JSW_AddressModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SearchType) {
    SearchTypeAddress = 0,
    SearchTypeZipcode = 1,
    SearchTypeAddressIndex = 2,
    SearchTypeZipcodeIndex = 3,
};

@interface MH_JSW_AddressPickerView : UIPickerView

@property (nullable, nonatomic, readonly) NSMutableArray<MH_JSW_AddressModel *> *addressDataArray;

@property (nonatomic, assign) NSInteger showTag;
@property (nonatomic, strong) MH_JSW_ToolView *   _Nullable toolBar;
@property (nonatomic, strong) UIView * _Nullable containerView;
@property (nonatomic, strong) void (^ _Nullable containerViewClickedBlock)(void);
@property (nonatomic, assign) NSInteger numberOfSection;

@property (nonatomic, strong) NSDictionary<NSAttributedStringKey, id> * _Nullable attributes;

- (void)showMOFSAddressPickerCommitBlock:(void(^_Nullable)(NSString * _Nullable address, NSString * _Nullable zipcode))commitBlock cancelBlock:(void(^_Nullable)(void))cancelBlock;

- (void)searchType:(SearchType)searchType key:(NSString *_Nullable)key block:(void(^_Nullable)(NSString * _Nullable result))block;

@end

NS_ASSUME_NONNULL_END
