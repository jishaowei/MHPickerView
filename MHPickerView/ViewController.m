//
//  ViewController.m
//  MHPickerView
//
//  Created by Ji Shaowei on 2019/6/22.
//  Copyright © 2019 51vision. All rights reserved.
//

#import "ViewController.h"
#import "MHPickerView/MOFSPickerManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)timeBtnAction:(id)sender {
    [[MOFSPickerManager shareManger]showDatePickerWithTag:1 datePickerMode:UIDatePickerModeDate commitBlock:^(NSDate * _Nonnull date) {
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
    [[MOFSPickerManager shareManger]showPickerViewWithDataArray:containArr title:@"biaoti" cancelTitle:@"quxiao" commitTitle:@"queding" commitBlock:^(NSString * _Nonnull string) {
        
    } cancelBlock:^{
        
    }];
}

- (IBAction)addressBtnAction:(id)sender {
    
    [[MOFSPickerManager shareManger]showMOFSAddressPickerWithTitle:@"dizhi" cancelTitle:@"quxiao" commitTitle:@"queding" commitBlock:^(NSString * _Nullable address, NSString * _Nullable zipcode) {
        NSLog(@"%@=====%@",address,zipcode);
    } cancelBlock:^{
        
    }];
    
}

- (IBAction)multipleAction:(id)sender {
    
    NSMutableArray * containArr = [NSMutableArray array];
    for (NSInteger i = 0; i < 99; i ++) {
        [containArr addObject:[NSString stringWithFormat:@"%ld",(long)i]];
    }
    NSInteger tag = [[MOFSPickerManager shareManger]automagicTag];
    [[MOFSPickerManager shareManger]showMultipleSelectedPickerViewWithDataArray:containArr tag:tag title:@"duoxuan" cancelTitle:@"quxiao" commitTitle:@"queding" commitBlock:^(NSArray * _Nullable containArray) {
        NSLog(@"%@",containArray);
    } cancelBlock:^{
        
    }];


}

@end
