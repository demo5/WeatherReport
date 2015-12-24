//
//  YQWeatherInfo.h
//  WeatherReport
//
//  Created by YoKing on 15/12/7.
//  Copyright © 2015年 YQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQWeatherInfo : NSObject

/** 城市*/
@property (nonatomic,strong) NSString *city;
/** 天气信息1*/
@property (nonatomic,strong) NSString *status1;
/** 天气信息2*/
@property (nonatomic,strong) NSString *status2;
/** 更新时间*/
@property (nonatomic,strong) NSString *udatetime;
/** 最高温度*/
@property (nonatomic,strong) NSString *temperature1;
/** 最低温度*/
@property (nonatomic,strong) NSString *temperature2;
/** 风力*/
@property (nonatomic,strong) NSString *power1;

/**返回天气信息的类方法*/
+(instancetype)weatherWithDic:(NSDictionary *)dic;
/**返回天气信息的对象方法*/
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
