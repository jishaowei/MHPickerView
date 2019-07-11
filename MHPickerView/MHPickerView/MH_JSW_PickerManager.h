//
//  MH_JSW_PickerManager.h
//  MHPickerView
//
//  Created by Ji Shaowei on 2019/6/30.
//  Copyright © 2019 51vision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MH_JSW_DatePicker.h"
#import "MH_JSW_PickerView.h"
#import "MH_JSW_AddressPickerView.h"
#import "MHMultipleSelectionPickerView.h"
#import "MHMultipleSpecialSelectionPickerView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^DatePickerCommitBlock)(NSDate * _Nonnull date);
typedef void (^DatePickerCancelBlock)(void);

typedef void (^PickerViewCommitBlock)(NSString * _Nonnull string);
typedef void (^PickerViewCustomCommitBlock)(id  _Nonnull model);
typedef void (^PickerViewCancelBlock)(void);

@interface MH_JSW_PickerManager : NSObject

+ (MH_JSW_PickerManager *_Nonnull)shareManger;

/**
 自动生成tag，避免自定义tag重复，从10001开始
 
 @return tag值
 */
- (NSInteger)automagicTag;

@property (nonatomic, strong) MH_JSW_DatePicker * _Nonnull datePicker;

@property (nonatomic, strong) MH_JSW_PickerView * _Nonnull pickView;

@property (nonatomic, strong) MH_JSW_AddressPickerView * _Nonnull addressPicker;

@property (nonatomic, strong) MHMultipleSelectionPickerView * _Nonnull multipleSelectedPickView;

@property (nonatomic, strong) MHMultipleSpecialSelectionPickerView * _Nonnull multipleSpecialSelectedPickView;

// ================================DatePicker===================================//

/**
 * show default datePicker.
 * default datePickerMode : UIDatePickerModeDate.
 * default cancelTitle : "取消".
 * default commitTitle : "确定".
 * default title : "".
 * @param tag : will remeber the last date you had select.
 */
- (void)showDatePickerWithTag:(NSInteger)tag commitBlock:(DatePickerCommitBlock _Nullable )commitBlock cancelBlock:(DatePickerCancelBlock _Nullable )cancelBlock;

/**
 * show default datePicker with your custom datePickerMode.
 * default cancelTitle : "取消".
 * default commitTitle : "确定".
 * default title : "".
 * @param tag : will remeber the last date you had select.
 * @param mode : UIDatePickerMode
 */
- (void)showDatePickerWithTag:(NSInteger)tag datePickerMode:(UIDatePickerMode)mode commitBlock:(DatePickerCommitBlock _Nullable )commitBlock cancelBlock:(DatePickerCancelBlock _Nullable )cancelBlock;

/**
 * show datePicker with your custom datePickerMode ,title , cancelTitle , commitTitle.
 * @param tag : will remeber the last date you had select.
 * @param title : toolbar title
 * @param cancelTitle : "".
 * @param commitTitle : "".
 * @param mode : UIDatePickerMode.
 */
- (void)showDatePickerWithTag:(NSInteger)tag title:(NSString *_Nullable)title cancelTitle:(NSString *_Nullable)cancelTitle commitTitle:(NSString *_Nullable)commitTitle datePickerMode:(UIDatePickerMode)mode commitBlock:(DatePickerCommitBlock _Nullable )commitBlock cancelBlock:(DatePickerCancelBlock _Nullable )cancelBlock;

/**
 * show datePicker with your custom datePickerMode ,firstDate , minDate , maxDate.
 * @param firstDate : show date.
 * @param minDate : minimumDate.
 * @param maxDate : maximumDate.
 * @param mode : UIDatePickerMode.
 */
- (void)showDatePickerWithTag:(NSInteger)tag firstDate:(NSDate *_Nullable)firstDate minDate:(NSDate *_Nullable)minDate maxDate:(NSDate *_Nullable)maxDate datePickerMode:(UIDatePickerMode)mode commitBlock:(DatePickerCommitBlock _Nullable )commitBlock cancelBlock:(DatePickerCancelBlock _Nullable )cancelBlock;

/**
 * show datePicker with your custom datePickerMode ,firstDate ,title , cancelTitle , commitTitle , minDate , maxDate.
 * @param title : toolbar title
 * @param cancelTitle : "".
 * @param commitTitle : "".
 * @param firstDate : show date.
 * @param minDate : minimumDate.
 * @param maxDate : maximumDate.
 * @param mode : UIDatePickerMode.
 * @param tag : will remeber the last date you had select.
 */
- (void)showDatePickerWithTitle:(NSString *_Nullable)title cancelTitle:(NSString *_Nullable)cancelTitle commitTitle:(NSString *_Nullable)commitTitle firstDate:(NSDate *_Nullable)firstDate minDate:(NSDate *_Nullable)minDate maxDate:(NSDate *_Nullable)maxDate datePickerMode:(UIDatePickerMode)mode tag:(NSInteger)tag commitBlock:(DatePickerCommitBlock _Nullable )commitBlock cancelBlock:(DatePickerCancelBlock _Nullable )cancelBlock;




// ================================pickerView===================================//


- (void)showPickerViewWithDataArray:(NSArray<NSString *> *_Nullable)array title:(NSString *_Nullable)title cancelTitle:(NSString *_Nullable)cancelTitle commitTitle:(NSString *_Nullable)commitTitle commitBlock:(PickerViewCommitBlock _Nullable )commitBlock cancelBlock:(PickerViewCancelBlock _Nullable )cancelBlock;

- (void)showPickerViewWithDataArray:(NSArray<NSString *> *_Nullable)array tag:(NSInteger)tag title:(NSString *_Nullable)title cancelTitle:(NSString *_Nullable)cancelTitle commitTitle:(NSString *_Nullable)commitTitle commitBlock:(PickerViewCommitBlock _Nullable )commitBlock cancelBlock:(PickerViewCancelBlock _Nullable )cancelBlock;


- (void)showPickerViewWithCustomDataArray:(NSArray *_Nullable)array keyMapper:(NSString *_Nullable)keyMapper title:(NSString *_Nullable)title cancelTitle:(NSString *_Nullable)cancelTitle commitTitle:(NSString *_Nullable)commitTitle commitBlock:(PickerViewCustomCommitBlock _Nullable)commitBlock cancelBlock:(PickerViewCancelBlock _Nullable )cancelBlock;

- (void)showPickerViewWithCustomDataArray:(NSArray *_Nullable)array keyMapper:(NSString *_Nullable)keyMapper tag:(NSInteger)tag title:(NSString *_Nullable)title cancelTitle:(NSString *_Nullable)cancelTitle commitTitle:(NSString *_Nullable)commitTitle commitBlock:(PickerViewCustomCommitBlock _Nullable)commitBlock cancelBlock:(PickerViewCancelBlock _Nullable )cancelBlock;

//===============================MHMultipleSelectionPickerView===================================//

/**
 多选弹框
 
 @param array 数据数组
 @param title 弹框标题
 @param cancelTitle 取消操作标题
 @param commitTitle 确认操作标题
 @param commitBlock 确认操作block
 @param cancelBlock 取消操作block
 */
- (void)showMultipleSelectedPickerViewWithDataArray:(NSArray<NSString *> *_Nullable)array title:(NSString *_Nullable)title cancelTitle:(NSString *_Nullable)cancelTitle commitTitle:(NSString *_Nullable)commitTitle commitBlock:(void(^_Nullable)(NSArray * _Nullable containArray))commitBlock cancelBlock:(PickerViewCancelBlock _Nullable )cancelBlock;

/**
 多选弹框
 
 @param array 数据数组
 @param tag 标签
 @param title 弹框标题
 @param cancelTitle 取消操作标题
 @param commitTitle 确认操作标题
 @param commitBlock 确认操作block
 @param cancelBlock 取消操作block
 */
- (void)showMultipleSelectedPickerViewWithDataArray:(NSArray<NSString *> *_Nullable)array tag:(NSInteger)tag title:(NSString *_Nullable)title cancelTitle:(NSString *_Nullable)cancelTitle commitTitle:(NSString *_Nullable)commitTitle commitBlock:(void(^_Nullable)(NSArray * _Nullable containArray))commitBlock cancelBlock:(PickerViewCancelBlock _Nullable )cancelBlock;

//===============================MHMultipleSpecialSelectionPickerView===================================//

/**
 多选弹框（有特殊列）

 @param array 数据数组
 @param specialName 特殊列内容
 @param title 弹框标题
 @param cancelTitle 取消操作标题
 @param commitTitle 确认操作标题
 @param commitBlock 确认操作block
 @param cancelBlock 取消操作block
 */
- (void)showMultipleSpecialSelectedPickerViewWithDataArray:(NSArray<NSString *> *)array specialContain:(NSString *)specialName title:(NSString *)title cancelTitle:(NSString *)cancelTitle commitTitle:(NSString *)commitTitle commitBlock:(void(^)(NSArray * containArray))commitBlock cancelBlock:(PickerViewCancelBlock)cancelBlock;

/**
 多选弹框（有特殊列）
 
 @param array 数据数组
 @param specialName 特殊列内容
 @param tag 标签
 @param title 弹框标题
 @param cancelTitle 取消操作标题
 @param commitTitle 确认操作标题
 @param commitBlock 确认操作block
 @param cancelBlock 取消操作block
 */
- (void)showMultipleSpecialSelectedPickerViewWithDataArray:(NSArray<NSString *> *)array specialContain:(NSString *)specialName tag:(NSInteger)tag title:(NSString *)title cancelTitle:(NSString *)cancelTitle commitTitle:(NSString *)commitTitle commitBlock:(void(^)(NSArray * containArray))commitBlock cancelBlock:(PickerViewCancelBlock)cancelBlock;

//===============================addressPicker===================================//

/**
 *  show addressPicker with your custom title, cancelTitle, commitTitle
 *
 *  @param title       your custom title
 *  @param cancelTitle your custom cancelTitle
 *  @param commitTitle your custom commitTitle
 *  @param commitBlock commitBlock
 *  @param cancelBlock cancelBlock
 */
- (void)showMOFSAddressPickerWithTitle:(NSString *_Nullable)title cancelTitle:(NSString *_Nullable)cancelTitle commitTitle:(NSString *_Nullable)commitTitle commitBlock:(void(^_Nullable)(NSString * _Nullable address, NSString * _Nullable zipcode))commitBlock cancelBlock:(void(^_Nullable)(void))cancelBlock;

/**
 *  show addressPicker with your custom title, cancelTitle, commitTitle
 *
 *  @param title       your custom title
 *  @param address     default address
 *  @param cancelTitle your custom cancelTitle
 *  @param commitTitle your custom commitTitle
 *  @param commitBlock commitBlock
 *  @param cancelBlock cancelBlock
 */
- (void)showMOFSAddressPickerWithDefaultAddress:(NSString *_Nullable)address title:(NSString *_Nullable)title cancelTitle:(NSString *_Nullable)cancelTitle commitTitle:(NSString *_Nullable)commitTitle commitBlock:(void(^_Nullable)(NSString * _Nullable address, NSString * _Nullable zipcode))commitBlock cancelBlock:(void(^_Nullable)(void))cancelBlock;

/**
 *  show addressPicker with your custom title, cancelTitle, commitTitle
 *
 *  @param zipcode     default zipcode
 *  @param title       your custom title
 *  @param cancelTitle your custom cancelTitle
 *  @param commitTitle your custom commitTitle
 *  @param commitBlock commitBlock
 *  @param cancelBlock cancelBlock
 */
- (void)showMOFSAddressPickerWithDefaultZipcode:(NSString *_Nullable)zipcode title:(NSString *_Nullable)title cancelTitle:(NSString *_Nullable)cancelTitle commitTitle:(NSString *_Nullable)commitTitle commitBlock:(void(^_Nullable)(NSString * _Nullable address, NSString * _Nullable zipcode))commitBlock cancelBlock:(void(^_Nullable)(void))cancelBlock;

/**
 *  searchAddressByZipcode
 *
 *  @param zipcode zipcode
 *  @param block block
 */
- (void)searchAddressByZipcode:(NSString *_Nullable)zipcode block:(void(^_Nullable)(NSString * _Nullable address))block;

/**
 *  searchZipCodeByAddress
 *
 *  @param address address
 *  @param block block
 */
- (void)searchZipCodeByAddress:(NSString *_Nullable)address block:(void(^_Nullable)(NSString * _Nullable zipcode))block;


/**
 *  searchIndexByAddress
 *
 *  @param address address
 *  @param block block
 */
- (void)searchIndexByAddress:(NSString *_Nullable)address block:(void(^_Nullable)(NSString * _Nullable address))block;


/**
 *  searchIndexByZipCode
 *
 *  @param zipcode address
 *  @param block block
 */
- (void)searchIndexByZipCode:(NSString *_Nullable)zipcode block:(void(^_Nullable)(NSString * _Nullable address))block;


@end

NS_ASSUME_NONNULL_END
