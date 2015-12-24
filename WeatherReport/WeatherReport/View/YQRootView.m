//
//  YQRootView.m
//  WeatherReport
//
//  Created by YoKing on 15/12/5.
//  Copyright © 2015年 YQ. All rights reserved.
//  根视图

#import "YQRootView.h"

#define rowNumber 3  //行数

@interface YQRootView()

@end

@implementation YQRootView

#pragma mark ----- 懒加载
-(YQCityView *)cityView{
    if (!_cityView) {
        self.cityView = [[YQCityView alloc] init];
    }
    return _cityView;
}
-(YQWeatherView *)weatherView{
    if (!_weatherView) {
        self.weatherView = [[YQWeatherView alloc] init];
    }
    return _weatherView;
}
-(YQTempView *)temperatureView{
    if (!_temperatureView) {
        self.temperatureView = [[YQTempView alloc] init];
    }
    return _temperatureView;
}
-(YQHumidityView *)humidityView{
    if (!_humidityView) {
        self.humidityView = [[YQHumidityView alloc] init];
    }
    return _humidityView;
}
-(YQPartMView *)particulateMatterView{
    if (!_particulateMatterView) {
        self.particulateMatterView = [[YQPartMView alloc] init];
    }
    return _particulateMatterView;
}
-(YQWindView *)windView{
    if (!_windView) {
        self.windView = [[YQWindView alloc] init];
    }
    return _windView;
}
#pragma mark ---- 初始化操作
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"background"];
        //1.城市信息
        YQCityView *cityView = [[YQCityView alloc] init];
        cityView.backgroundColor = [UIColor colorWithPatternImage:image];
        [self addSubview:cityView];
        self.cityView = cityView;
        
        //2.温度信息
        YQTempView *temperatureView = [[YQTempView alloc] init];
        temperatureView.backgroundColor = [UIColor colorWithPatternImage:image];
        [self addSubview:temperatureView];
        self.temperatureView = temperatureView;
        
        //3湿度信息
        YQHumidityView *humidityView = [[YQHumidityView alloc] init];
        humidityView.backgroundColor = [UIColor colorWithPatternImage:image];
        [self addSubview:humidityView];
        self.humidityView = humidityView;
        
        //4.天气信息
        YQWeatherView *weatherView = [[YQWeatherView alloc] init];
        weatherView.backgroundColor = [UIColor colorWithPatternImage:image];
        [self addSubview:weatherView];
        self.weatherView = weatherView;
        
        //5.pm2.5信息
        YQPartMView *particulateMatterView = [[YQPartMView alloc] init];
        particulateMatterView.backgroundColor = [UIColor colorWithPatternImage:image];
        [self addSubview:particulateMatterView];
        self.particulateMatterView = particulateMatterView;
        
        //6.风力信息
        YQWindView *windView = [[YQWindView alloc] init];
        windView.backgroundColor = [UIColor colorWithPatternImage:image];
        [self addSubview:windView];
        self.windView = windView;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    //每个模块的宽和高
    CGFloat width = self.width * 0.5;
    CGFloat hight = self.height / 3;
    NSInteger count = [self subviews].count;
    
    for (NSInteger i = 0; i < count; i++) {
        int row = (int)i / rowNumber;//行号
        int loc = (int)i % rowNumber;//列号
        self.subviews[i].frame = CGRectMake(row * width, loc * hight, width, hight);
        
    }
}


@end
