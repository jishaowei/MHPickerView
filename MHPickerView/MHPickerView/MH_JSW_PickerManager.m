//
//  MH_JSW_PickerManager.m
//  MHPickerView
//
//  Created by Ji Shaowei on 2019/6/30.
//  Copyright © 2019 51vision. All rights reserved.
//

#import "MH_JSW_PickerManager.h"

@implementation MH_JSW_PickerManager

+ (MH_JSW_PickerManager *)shareManger {
    static MH_JSW_PickerManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [self new];
    });
    return  manager;
}

- (NSInteger)automagicTag
{
    static NSInteger mytag = 10000;
    mytag ++;
    return mytag;
}

- (MH_JSW_DatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [MH_JSW_DatePicker new];
    }
    return _datePicker;
}

- (MH_JSW_PickerView *)pickView {
    if (!_pickView) {
        _pickView = [MH_JSW_PickerView new];
    }
    return _pickView;
}

- (MH_JSW_AddressPickerView *)addressPicker {
    if (!_addressPicker) {
        _addressPicker = [MH_JSW_AddressPickerView new];
    }
    return _addressPicker;
}

- (MHMultipleSelectionPickerView *)multipleSelectedPickView
{
    if (!_multipleSelectedPickView) {
        _multipleSelectedPickView = [MHMultipleSelectionPickerView new];
    }
    return _multipleSelectedPickView;
}

// ================================DatePicker===================================//

- (void)showDatePickerWithTag:(NSInteger)tag commitBlock:(DatePickerCommitBlock)commitBlock cancelBlock:(DatePickerCancelBlock)cancelBlock {
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
    self.datePicker.toolBar.cancelBarTitle = @"取消";
    self.datePicker.toolBar.commitBarTitle = @"确定";
    
    self.datePicker.minimumDate = nil;
    self.datePicker.maximumDate = nil;
    [self.datePicker showMOFSDatePickerViewWithTag:tag firstDate:nil commit:^(NSDate *date) {
        if (commitBlock) {
            commitBlock(date);
        }
    } cancel:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
}

- (void)showDatePickerWithTag:(NSInteger)tag datePickerMode:(UIDatePickerMode)mode commitBlock:(DatePickerCommitBlock)commitBlock cancelBlock:(DatePickerCancelBlock)cancelBlock {
    self.datePicker.datePickerMode = mode;
    
    self.datePicker.toolBar.cancelBarTitle = @"取消";
    self.datePicker.toolBar.commitBarTitle = @"确定";
    
    self.datePicker.minimumDate = nil;
    self.datePicker.maximumDate = nil;
    [self.datePicker showMOFSDatePickerViewWithTag:tag firstDate:nil commit:^(NSDate *date) {
        if (commitBlock) {
            commitBlock(date);
        }
    } cancel:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
}

- (void)showDatePickerWithTag:(NSInteger)tag title:(NSString *)title cancelTitle:(NSString *)cancelTitle commitTitle:(NSString *)commitTitle datePickerMode:(UIDatePickerMode)mode commitBlock:(DatePickerCommitBlock)commitBlock cancelBlock:(DatePickerCancelBlock)cancelBlock {
    self.datePicker.datePickerMode = mode;
    
    self.datePicker.toolBar.titleBarTitle = title;
    self.datePicker.toolBar.cancelBarTitle = cancelTitle;
    self.datePicker.toolBar.commitBarTitle = commitTitle;
    
    self.datePicker.minimumDate = nil;
    self.datePicker.maximumDate = nil;
    [self.datePicker showMOFSDatePickerViewWithTag:tag firstDate:nil commit:^(NSDate *date) {
        if (commitBlock) {
            commitBlock(date);
        }
    } cancel:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
}

- (void)showDatePickerWithTag:(NSInteger)tag firstDate:(NSDate *)firstDate minDate:(NSDate *)minDate maxDate:(NSDate *)maxDate datePickerMode:(UIDatePickerMode)mode commitBlock:(DatePickerCommitBlock)commitBlock cancelBlock:(DatePickerCancelBlock)cancelBlock {
    self.datePicker.datePickerMode = mode;
    
    self.datePicker.toolBar.cancelBarTitle = @"取消";
    self.datePicker.toolBar.commitBarTitle = @"确定";
    
    self.datePicker.minimumDate = minDate;
    self.datePicker.maximumDate = maxDate;
    
    [self.datePicker showMOFSDatePickerViewWithTag:tag firstDate:firstDate commit:^(NSDate *date) {
        if (commitBlock) {
            commitBlock(date);
        }
    } cancel:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
}


- (void)showDatePickerWithTitle:(NSString *)title cancelTitle:(NSString *)cancelTitle commitTitle:(NSString *)commitTitle firstDate:(NSDate *)firstDate minDate:(NSDate *)minDate maxDate:(NSDate *)maxDate datePickerMode:(UIDatePickerMode)mode tag:(NSInteger)tag commitBlock:(DatePickerCommitBlock)commitBlock cancelBlock:(DatePickerCancelBlock)cancelBlock {
    self.datePicker.datePickerMode = mode;
    
    self.datePicker.toolBar.titleBarTitle = title;
    self.datePicker.toolBar.cancelBarTitle = cancelTitle;
    self.datePicker.toolBar.commitBarTitle = commitTitle;
    
    self.datePicker.minimumDate = minDate;
    self.datePicker.maximumDate = maxDate;
    
    [self.datePicker showMOFSDatePickerViewWithTag:tag firstDate:firstDate commit:^(NSDate *date) {
        if (commitBlock) {
            commitBlock(date);
        }
    } cancel:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
}

// ================================pickerView===================================//

- (void)showPickerViewWithDataArray:(NSArray<NSString *> *)array title:(NSString *)title cancelTitle:(NSString *)cancelTitle commitTitle:(NSString *)commitTitle commitBlock:(PickerViewCommitBlock)commitBlock cancelBlock:(PickerViewCancelBlock)cancelBlock {
    self.pickView.needTag = false;
    self.pickView.toolBar.titleBarTitle = title;
    self.pickView.toolBar.cancelBarTitle = cancelTitle;
    self.pickView.toolBar.commitBarTitle = commitTitle;
    [self.pickView showMOFSPickerViewWithDataArray:array commitBlock:^(NSString *string) {
        if (commitBlock) {
            commitBlock(string);
        }
    } cancelBlock:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
}

- (void)showPickerViewWithDataArray:(NSArray<NSString *> *)array tag:(NSInteger)tag title:(NSString *)title cancelTitle:(NSString *)cancelTitle commitTitle:(NSString *)commitTitle commitBlock:(PickerViewCommitBlock)commitBlock cancelBlock:(PickerViewCancelBlock)cancelBlock {
    
    self.pickView.needTag = true;
    self.pickView.showTag = tag;
    self.pickView.toolBar.titleBarTitle = title;
    self.pickView.toolBar.cancelBarTitle = cancelTitle;
    self.pickView.toolBar.commitBarTitle = commitTitle;
    [self.pickView showMOFSPickerViewWithDataArray:array commitBlock:^(NSString *string) {
        if (commitBlock) {
            commitBlock(string);
        }
    } cancelBlock:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
    
}

- (void)showPickerViewWithCustomDataArray:(NSArray *)array keyMapper:(NSString *)keyMapper title:(NSString *)title cancelTitle:(NSString *)cancelTitle commitTitle:(NSString *)commitTitle commitBlock:(PickerViewCustomCommitBlock)commitBlock cancelBlock:(PickerViewCancelBlock)cancelBlock
{
    self.pickView.needTag = false;
    self.pickView.toolBar.titleBarTitle = title;
    self.pickView.toolBar.cancelBarTitle = cancelTitle;
    self.pickView.toolBar.commitBarTitle = commitTitle;
    [self.pickView showMOFSPickerViewWithCustomDataArray:array keyMapper:keyMapper commitBlock:^(id model) {
        if (commitBlock) {
            commitBlock(model);
        }
    } cancelBlock:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
}

- (void)showPickerViewWithCustomDataArray:(NSArray *)array keyMapper:(NSString *)keyMapper tag:(NSInteger)tag title:(NSString *)title cancelTitle:(NSString *)cancelTitle commitTitle:(NSString *)commitTitle commitBlock:(PickerViewCustomCommitBlock)commitBlock cancelBlock:(PickerViewCancelBlock)cancelBlock {
    self.pickView.needTag = true;
    self.pickView.showTag = tag;
    self.pickView.toolBar.titleBarTitle = title;
    self.pickView.toolBar.cancelBarTitle = cancelTitle;
    self.pickView.toolBar.commitBarTitle = commitTitle;
    [self.pickView showMOFSPickerViewWithCustomDataArray:array keyMapper:keyMapper commitBlock:^(id model) {
        if (commitBlock) {
            commitBlock(model);
        }
    } cancelBlock:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
}

//===============================MHMultipleSelectionPickerView===================================//

- (void)showMultipleSelectedPickerViewWithDataArray:(NSArray<NSString *> *)array title:(NSString *)title cancelTitle:(NSString *)cancelTitle commitTitle:(NSString *)commitTitle commitBlock:(void(^)(NSArray * containArray))commitBlock cancelBlock:(PickerViewCancelBlock)cancelBlock {
    self.multipleSelectedPickView.needTag = false;
    self.multipleSelectedPickView.toolBar.titleBarTitle = title;
    self.multipleSelectedPickView.toolBar.cancelBarTitle = cancelTitle;
    self.multipleSelectedPickView.toolBar.commitBarTitle = commitTitle;
    [self.multipleSelectedPickView showMHMultipleSelectedPickerViewWithDataArray:array commitBlock:^(NSArray * _Nonnull containArray) {
        if (commitBlock) {
            commitBlock(containArray);
        }
    } cancelBlock:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
}

- (void)showMultipleSelectedPickerViewWithDataArray:(NSArray<NSString *> *)array tag:(NSInteger)tag title:(NSString *)title cancelTitle:(NSString *)cancelTitle commitTitle:(NSString *)commitTitle commitBlock:(void(^)(NSArray * containArray))commitBlock cancelBlock:(PickerViewCancelBlock)cancelBlock {
    
    self.pickView.needTag = true;
    self.pickView.showTag = tag;
    self.pickView.toolBar.titleBarTitle = title;
    self.pickView.toolBar.cancelBarTitle = cancelTitle;
    self.pickView.toolBar.commitBarTitle = commitTitle;
    [self.multipleSelectedPickView showMHMultipleSelectedPickerViewWithDataArray:array commitBlock:^(NSArray * _Nonnull containArray) {
        if (commitBlock) {
            commitBlock(containArray);
        }
    } cancelBlock:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
    
}
//===============================addressPicker===================================//

- (void)showMOFSAddressPickerWithTitle:(NSString *)title cancelTitle:(NSString *)cancelTitle commitTitle:(NSString *)commitTitle commitBlock:(void(^)(NSString *address, NSString *zipcode))commitBlock cancelBlock:(void(^)(void))cancelBlock {
    self.addressPicker.toolBar.titleBarTitle = title;
    self.addressPicker.toolBar.cancelBarTitle = cancelTitle;
    self.addressPicker.toolBar.commitBarTitle = commitTitle;
    [self.addressPicker showMOFSAddressPickerCommitBlock:^(NSString *address, NSString *zipcode) {
        if (commitBlock) {
            commitBlock(address, zipcode);
        }
    } cancelBlock:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
}

- (void)showMOFSAddressPickerWithDefaultAddress:(NSString *)address title:(NSString *)title cancelTitle:(NSString *)cancelTitle commitTitle:(NSString *)commitTitle commitBlock:(void(^)(NSString *address, NSString *zipcode))commitBlock cancelBlock:(void(^)(void))cancelBlock {
    self.addressPicker.toolBar.titleBarTitle = title;
    self.addressPicker.toolBar.cancelBarTitle = cancelTitle;
    self.addressPicker.toolBar.commitBarTitle = commitTitle;
    
    [self.addressPicker showMOFSAddressPickerCommitBlock:^(NSString *address, NSString *zipcode) {
        if (commitBlock) {
            commitBlock(address, zipcode);
        }
    } cancelBlock:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
    
    if (address == nil || [address isEqualToString:@""]) {
        return;
    }
    
    [self searchIndexByAddress:address block:^(NSString *address) {
        BOOL flag = [address rangeOfString:@"error"].location == NSNotFound;
        if (flag) {
            NSArray *indexArr = [address componentsSeparatedByString:@"-"];
            for (int i = 0; i < indexArr.count; i++) {
                @try {
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [self.addressPicker selectRow:[indexArr[i] integerValue] inComponent:i animated:NO];
                    });
                } @catch (NSException *exception) {
                    
                } @finally {
                    
                }
                
            }
        }
    }];
    
}

- (void)showMOFSAddressPickerWithDefaultZipcode:(NSString *)zipcode title:(NSString *)title cancelTitle:(NSString *)cancelTitle commitTitle:(NSString *)commitTitle commitBlock:(void (^)(NSString *, NSString *))commitBlock cancelBlock:(void (^)(void))cancelBlock {
    self.addressPicker.toolBar.titleBarTitle = title;
    self.addressPicker.toolBar.cancelBarTitle = cancelTitle;
    self.addressPicker.toolBar.commitBarTitle = commitTitle;
    
    [self.addressPicker showMOFSAddressPickerCommitBlock:^(NSString *address, NSString *zipcode) {
        if (commitBlock) {
            commitBlock(address, zipcode);
        }
    } cancelBlock:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
    
    if (zipcode == nil || [zipcode  isEqual: @""]) {
        return;
    }
    
    [self searchIndexByZipCode:zipcode block:^(NSString *address) {
        BOOL flag = [address rangeOfString:@"error"].location == NSNotFound;
        if (flag) {
            NSArray *indexArr = [address componentsSeparatedByString:@"-"];
            for (int i = 0; i < indexArr.count; i++) {
                @try {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.addressPicker selectRow:[indexArr[i] integerValue] inComponent:i animated:NO];
                    });
                } @catch (NSException *exception) {
                    
                } @finally {
                    
                }
                
            }
        }
    }];
    
}

- (void)searchAddressByZipcode:(NSString *)zipcode block:(void(^)(NSString *address))block {
    [self.addressPicker searchType:SearchTypeAddress key:zipcode block:^(NSString *result) {
        if (block) {
            block(result);
        }
    }];
}

- (void)searchZipCodeByAddress:(NSString *)address block:(void(^)(NSString *zipcode))block {
    [self.addressPicker searchType:SearchTypeZipcode key:address block:^(NSString *result) {
        if (block) {
            block(result);
        }
    }];
}

- (void)searchIndexByAddress:(NSString *)address block:(void(^)(NSString *address))block {
    [self.addressPicker searchType:SearchTypeAddressIndex key:address block:^(NSString *result) {
        if (block) {
            block(result);
        }
    }];
}

- (void)searchIndexByZipCode:(NSString *)zipcode block:(void (^)(NSString *))block {
    [self.addressPicker searchType:SearchTypeZipcodeIndex key:zipcode block:^(NSString *result) {
        if (block) {
            block(result);
        }
    }];
}

@end