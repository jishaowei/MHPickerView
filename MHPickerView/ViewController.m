//
//  ViewController.m
//  MHPickerView
//
//  Created by Ji Shaowei on 2019/6/22.
//  Copyright © 2019 51vision. All rights reserved.
//

#import "ViewController.h"
#import "MHPickerView/MH_JSW_PickerManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)timeBtnAction:(id)sender {
    [[MH_JSW_PickerManager shareManger]showDatePickerWithTag:1 datePickerMode:UIDatePickerModeDate commitBlock:^(NSDate * _Nonnull date) {
        NSLog(@"%@",date);
    } cancelBlock:^{
        NSLog(@"456");
    }];
}

- (IBAction)commendBtnAction:(id)sender {
    NSMutableArray * containArr = [NSMutableArray array];
    for (NSInteger i = 0; i < 3; i ++) {
        [containArr addObject:[NSString stringWithFormat:@"%ld",(long)i]];
    }
    [[MH_JSW_PickerManager shareManger]showPickerViewWithDataArray:containArr title:@"biaoti" cancelTitle:@"quxiao" commitTitle:@"queding" commitBlock:^(NSString * _Nonnull string) {
        
    } cancelBlock:^{
        
    }];
}

- (IBAction)addressBtnAction:(id)sender {
    
    [[MH_JSW_PickerManager shareManger]showMOFSAddressPickerWithTitle:@"dizhi" cancelTitle:@"quxiao" commitTitle:@"queding" commitBlock:^(NSString * _Nullable address, NSString * _Nullable zipcode) {
        NSLog(@"%@=====%@",address,zipcode);
    } cancelBlock:^{
        
    }];
    
}

- (IBAction)multipleAction:(id)sender {
    
    NSMutableArray * containArr = [NSMutableArray array];
    for (NSInteger i = 0; i < 99; i ++) {
        [containArr addObject:[NSString stringWithFormat:@"%ld",(long)i]];
    }
    NSInteger tag = [[MH_JSW_PickerManager shareManger]automagicTag];
    [[MH_JSW_PickerManager shareManger]showMultipleSelectedPickerViewWithDataArray:containArr tag:tag title:@"duoxuan" cancelTitle:@"quxiao" commitTitle:@"queding" commitBlock:^(NSArray * _Nullable containArray) {
        NSLog(@"%@",containArray);
    } cancelBlock:^{
        
    }];

}

- (IBAction)mulSpecialAction:(id)sender {
    NSMutableArray * containArr = [NSMutableArray array];
    for (NSInteger i = 0; i < 99; i ++) {
        [containArr addObject:[NSString stringWithFormat:@"%ld",(long)i]];
    }
    NSInteger tag = [[MH_JSW_PickerManager shareManger]automagicTag];
    [[MH_JSW_PickerManager shareManger]showMultipleSpecialSelectedPickerViewWithDataArray:containArr specialContain:@"3" tag:tag title:@"duoxuans" cancelTitle:@"quxiao" commitTitle:@"queding" commitBlock:^(NSArray * _Nonnull containArray) {
        NSLog(@"%@",containArray);
    } cancelBlock:^{
        
    }];
}

@end
