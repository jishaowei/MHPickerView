//
//  MultipleSelectedView.m
//  MHPickerView
//
//  Created by Ji Shaowei on 2019/6/28.
//  Copyright © 2019 51vision. All rights reserved.
//

#import "MultipleSelectedView.h"
#import <Masonry/Masonry.h>

@implementation MultipleSelectedView

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIButton * selectedButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:selectedButton];
        [selectedButton setImage:[UIImage imageNamed:@"MH_Public_NoSelected"] forState:UIControlStateNormal];
        [selectedButton setImage:[UIImage imageNamed:@"MH_Public_Selected"] forState:UIControlStateSelected];
        selectedButton.userInteractionEnabled = NO;
        [selectedButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.left.mas_equalTo(self.mas_left).offset(16);
            make.size.mas_lessThanOrEqualTo(CGSizeMake(23, 23));
        }];
        self.selectedBtn = selectedButton;
        
        UILabel * title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        title.textColor = [UIColor colorWithRed:51.f/255.f green:51.f/255.f blue:51.f/255.f alpha:1];
        title.font = [UIFont systemFontOfSize:15];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.left.mas_equalTo(selectedButton.mas_right).offset(6);
            make.right.mas_equalTo(self.mas_right).offset(-16);
        }];
        self.titleLab = title;

    }
    return self;
}

@end
