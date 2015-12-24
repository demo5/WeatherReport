//
//  YQRootView.h
//  WeatherReport
//
//  Created by YoKing on 15/12/5.
//  Copyright © 2015年 YQ. All rights reserved.
//  根目录

#import <UIKit/UIKit.h>

#import "YQCityView.h"
#import "YQWeatherView.h"
#import "YQTempView.h"
#import "YQHumidityView.h"
#import "YQPartMView.h"
#import "YQWindView.h"

@interface YQRootView : UIView

@property (nonatomic,strong) YQCityView *cityView;   //城市信息
@property (nonatomic,strong) YQWeatherView *weatherView; //天气信息
@property (nonatomic,strong) YQTempView *temperatureView;//温度信息
@property (nonatomic,strong) YQHumidityView *humidityView;//湿度信息
@property (nonatomic,strong) YQPartMView *particulateMatterView;//pm2.5信息
@property (nonatomic,strong) YQWindView *windView;//风力信息

@end
