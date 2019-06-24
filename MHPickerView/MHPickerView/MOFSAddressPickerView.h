//
//  MOFSAddressPickerView.h
//  MOFSPickerManager
//
//  Created by luoyuan on 16/8/31.
//  Copyright © 2016年 luoyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MOFSToolView.h"
#import "AddressModel.h"

typedef NS_ENUM(NSInteger, SearchType) {
    SearchTypeAddress = 0,
    SearchTypeZipcode = 1,
    SearchTypeAddressIndex = 2,
    SearchTypeZipcodeIndex = 3,
};

@interface MOFSAddressPickerView : UIPickerView

@property (nullable, nonatomic, readonly) NSMutableArray<AddressModel *> *addressDataArray;

@property (nonatomic, assign) NSInteger showTag;
@property (nonatomic, strong) MOFSToolView *   _Nullable toolBar;
@property (nonatomic, strong) UIView * _Nullable containerView;
@property (nonatomic, strong) void (^ _Nullable containerViewClickedBlock)(void);
@property (nonatomic, assign) NSInteger numberOfSection;

@property (nonatomic, strong) NSDictionary<NSAttributedStringKey, id> * _Nullable attributes;

- (void)showMOFSAddressPickerCommitBlock:(void(^_Nullable)(NSString * _Nullable address, NSString * _Nullable zipcode))commitBlock cancelBlock:(void(^_Nullable)(void))cancelBlock;

- (void)searchType:(SearchType)searchType key:(NSString *_Nullable)key block:(void(^_Nullable)(NSString * _Nullable result))block;

@end
