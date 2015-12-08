//
//  YQRootView.h
//  WeatherReport
//
//  Created by YoKing on 15/12/5.
//  Copyright © 2015年 YQ. All rights reserved.
//  根目录

#import <UIKit/UIKit.h>

@interface YQRootView : UIView

@property (nonatomic,weak) UIView *cityView;   //城市信息
@property (nonatomic,weak) UIView *weatherView; //天气信息
@property (nonatomic,weak) UIView *temperatureView;//温度信息
@property (nonatomic,weak) UIView *humidityView;//湿度信息
@property (nonatomic,weak) UIView *ParticulateMatterView;//pm2.5信息
@property (nonatomic,weak) UIView *windView;//风力信息

@end
