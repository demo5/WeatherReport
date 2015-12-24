//
//  YQWeatherInfo.m
//  WeatherReport
//
//  Created by YoKing on 15/12/7.
//  Copyright © 2015年 YQ. All rights reserved.
//

#import "YQWeatherInfo.h"

@implementation YQWeatherInfo


+(instancetype)weatherWithDic:(NSDictionary *)dic{
    
    return [[self alloc] initWithDict:dic];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
