//
//  MHMultipleSelectionPickerView.m
//  MHPickerView
//
//  Created by Ji Shaowei on 2019/6/27.
//  Copyright © 2019 51vision. All rights reserved.
//

#import "MHMultipleSelectionPickerView.h"
#import <objc/runtime.h>
#import "MultipleSelectedView.h"

#define UISCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define UISCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface MHMultipleSelectionPickerView() <UITableViewDelegate , UITableViewDataSource>

@property (nonatomic, strong) NSMutableDictionary *recordDic;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, assign) NSInteger selectedRow;

@property (nonatomic, copy) NSString *keyMapper; //自定义解析Key

@end

@implementation MHMultipleSelectionPickerView

#pragma mark - setter

- (void)setAttributes:(NSDictionary<NSAttributedStringKey,id> *)attributes {
    _attributes = attributes;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadData];
    });
}

#pragma mark - gettter

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (NSMutableDictionary *)recordDic {
    if (!_recordDic) {
        _recordDic = [NSMutableDictionary dictionary];
    }
    return _recordDic;
}

#pragma mark - create UI

- (instancetype)initWithFrame:(CGRect)frame {
    
    [self initToolBar];
    [self initContainerView];
    
    CGRect initialFrame;
    if (CGRectIsEmpty(frame)) {
        initialFrame = CGRectMake(0, self.toolBar.frame.size.height, UISCREEN_WIDTH, 296);
    } else {
        initialFrame = frame;
    }
    self = [super initWithFrame:initialFrame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.delegate = self;
        self.dataSource = self;
        
        [self initBgView];
    }
    return self;
}

- (void)initToolBar {
    self.toolBar = [[MH_JSW_ToolView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, 52)];
    self.toolBar.backgroundColor = [UIColor whiteColor];
}

- (void)initContainerView {
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_HEIGHT)];
    self.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    self.containerView.userInteractionEnabled = YES;
    [self.containerView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(containerViewClickedAction)]];
}

- (void)initBgView {
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, UISCREEN_HEIGHT - self.frame.size.height - 52, UISCREEN_WIDTH, self.frame.size.height + self.toolBar.frame.size.height)];
}

#pragma mark - Action

- (void)showMHMultipleSelectedPickerViewWithDataArray:(NSArray<NSString *> *)array commitBlock:(void(^)(NSArray * containArray))commitBlock cancelBlock:(void(^)(void))cancelBlock {
    self.keyMapper = nil;
    self.dataArr = [NSMutableArray array];
    for (NSString * string in array) {
        MultipleSelectionModel * model = [[MultipleSelectionModel alloc]init];
        model.containString = string;
        model.cellSelected = NO;
        [self.dataArr addObject:model];
    }
    [self reloadData];
    self.selectedRow = 0;
    NSString *tagStr = [NSString stringWithFormat:@"%ld",(long)self.showTag];
    if (self.needTag)
    {
        if ([self.recordDic.allKeys containsObject:tagStr]) {
            self.selectedRow = [self.recordDic[tagStr] integerValue];
        }
    }
    [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.selectedRow inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    
    [self showWithAnimation];
    
    __weak __typeof(self) weakSelf = self;
    self.toolBar.cancelBlock = ^ {
        if (cancelBlock) {
            [weakSelf hiddenWithAnimation];
            cancelBlock();
        }
    };
    
    self.toolBar.commitBlock = ^ {
        [weakSelf hiddenWithAnimation];
        if (commitBlock) {
            NSString *rowStr = [NSString stringWithFormat:@"%ld",(long)weakSelf.selectedRow];
            [weakSelf.recordDic setValue:rowStr forKey:tagStr];
            NSMutableArray * commitArr = [NSMutableArray array];
            for (MultipleSelectionModel * model in weakSelf.dataArr) {
                if (model.cellSelected) {
                    [commitArr addObject:model.containString];
                }
            }
            commitBlock(commitArr);
        }
    };
}

- (void)showWithAnimation {
    [self addViews];
    self.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    CGFloat height = self.bgView.frame.size.height;
    self.bgView.center = CGPointMake(UISCREEN_WIDTH / 2, UISCREEN_HEIGHT + height / 2);
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.center = CGPointMake(UISCREEN_WIDTH / 2, UISCREEN_HEIGHT - height / 2);
        self.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }];
    
}

- (void)hiddenWithAnimation {
    CGFloat height = self.bgView.frame.size.height;
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.center = CGPointMake(UISCREEN_WIDTH / 2, UISCREEN_HEIGHT + height / 2);
        self.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    } completion:^(BOOL finished) {
        [self hiddenViews];
    }];
}

- (void)containerViewClickedAction {
    if (self.containerViewClickedBlock) {
        self.containerViewClickedBlock();
    }
    [self hiddenWithAnimation];
}

- (void)addViews {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.containerView];
    [window addSubview:self.bgView];
    [self.bgView addSubview:self.toolBar];
    [self.bgView addSubview:self];
}

- (void)hiddenViews {
    [self removeFromSuperview];
    [self.toolBar removeFromSuperview];
    [self.bgView removeFromSuperview];
    [self.containerView removeFromSuperview];
}

#pragma mark - delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MultipleSelectionModel * model = self.dataArr[indexPath.row];

    static NSString * identifier = @"MultipleSelectedView";
    MultipleSelectedView * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MultipleSelectedView alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.titleLab.attributedText = [[NSAttributedString alloc] initWithString:model.containString attributes:_attributes];
    cell.selectedBtn.selected = model.cellSelected;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MultipleSelectionModel * model = self.dataArr[indexPath.row];
    model.cellSelected = !model.cellSelected;
    self.selectedRow = indexPath.row;
    [tableView reloadData];
}

@end



@implementation MultipleSelectionModel

@end



@implementation NSString (MHMultipleSelectionPickerView)

@dynamic mufs_key, mufs_int_key;

- (void)setMufs_key:(NSString *)mufs_key {
    objc_setAssociatedObject(self, @selector(mufs_key), mufs_key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)mufs_key {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setMufs_int_key:(NSInteger)mufs_int_key {
    objc_setAssociatedObject(self, @selector(mufs_int_key), @(mufs_int_key), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)mufs_int_key {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

@end
