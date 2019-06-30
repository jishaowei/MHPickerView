//
//  MH_JSW_AddressModel.m
//  MHPickerView
//
//  Created by Ji Shaowei on 2019/6/30.
//  Copyright © 2019 51vision. All rights reserved.
//

#import "MH_JSW_AddressModel.h"

@implementation MH_JSW_AddressModel

- (NSMutableArray *)list {
    if (!_list) {
        _list = [NSMutableArray array];
    }
    return _list;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        if (dictionary) {
            self.name = dictionary[@"name"];
            self.zipcode = dictionary[@"zipcode"];
        }
    }
    return self;
}

@end

@implementation MH_JSW_CityModel

- (NSMutableArray *)list {
    if (!_list) {
        _list = [NSMutableArray array];
    }
    return _list;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        if (dictionary) {
            self.name = dictionary[@"name"];
            self.zipcode = dictionary[@"zipcode"];
        }
    }
    return self;
}

@end

@implementation MH_JSW_DistrictModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        if (dictionary) {
            self.name = dictionary[@"name"];
            self.zipcode = dictionary[@"zipcode"];
        }
    }
    return self;
}

@end
