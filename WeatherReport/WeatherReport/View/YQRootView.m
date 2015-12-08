//
//  YQRootView.m
//  WeatherReport
//
//  Created by YoKing on 15/12/5.
//  Copyright © 2015年 YQ. All rights reserved.
//  根视图

#import "YQRootView.h"
#import "AFNetworking.h"

#import "YQCityView.h"
#import "YQWeatherView.h"
#import "YQTempView.h"
#import "YQHumidityView.h"
#import "YQPartMView.h"
#import "YQWindView.h"

#define rowNumber 3  //行数

@interface YQRootView()

@property (nonatomic,strong) YQCityView *citySubview;
@property (nonatomic,strong) YQWeatherView *weatherSubview;
@property (nonatomic,strong) YQTempView *tempSubview;
@property (nonatomic,strong) YQHumidityView *humiSubview;
@property (nonatomic,strong) YQPartMView *PMSubview;
@property (nonatomic,strong) YQWindView *windSubview;
@end

@implementation YQRootView

#pragma mark ----- 懒加载

-(YQCityView *)citySubview{
    if (!_citySubview) {
        self.citySubview = [[YQCityView alloc] init];
    }
    return _citySubview;
}
-(YQWeatherView *)weatherSubview{
    if (!_weatherSubview) {
        self.weatherSubview = [[YQWeatherView alloc] init];
    }
    return _weatherSubview;
}
-(YQTempView *)tempSubview{
    if (!_tempSubview) {
        self.tempSubview = [[YQTempView alloc] init];
    }
    return _tempSubview;
}
-(YQHumidityView *)humiSubview{
    if (!_humiSubview) {
        self.humiSubview = [[YQHumidityView alloc] init];
    }
    return _humiSubview;
}
-(YQWindView *)windSubview{
    if (!_windSubview) {
        self.windSubview = [[YQWindView alloc] init];
    }
    return _windSubview;
}
-(YQPartMView *)PMSubview{
    if (!_PMSubview) {
        self.PMSubview = [[YQPartMView alloc] init];
    }
    return _PMSubview;
}
#pragma mark ---- 初始化操作
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //1.城市信息
        YQCityView *cityView = [[YQCityView alloc] init];
        cityView.backgroundColor = YQRandomColor;
        [self addSubview:cityView];
        self.cityView = cityView;
        
        //2.温度信息
        YQTempView *temperatureView = [[YQTempView alloc] init];
        temperatureView.backgroundColor = YQRandomColor;
        [self addSubview:temperatureView];
        self.cityView = temperatureView;
        
        //3湿度信息
        YQHumidityView *humidityView = [[YQHumidityView alloc] init];
        humidityView.backgroundColor = YQRandomColor;
        [self addSubview:humidityView];
        self.cityView = humidityView;
        
        //4.天气信息
        YQWeatherView *weatherView = [[YQWeatherView alloc] init];
        weatherView.backgroundColor = YQRandomColor;
        [self addSubview:weatherView];
        self.cityView = weatherView;
        
        //5.pm2.5信息
        YQPartMView *ParticulateMatterView = [[YQPartMView alloc] init];
        ParticulateMatterView.backgroundColor = YQRandomColor;
        [self addSubview:ParticulateMatterView];
        self.cityView = ParticulateMatterView;
        
        //6.风力信息
        YQWindView *windView = [[YQWindView alloc] init];
        windView.backgroundColor = YQRandomColor;
        [self addSubview:windView];
        self.cityView = windView;
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
        int row = i / rowNumber;//行号
        int loc = i % rowNumber;//列号
        self.subviews[i].frame = CGRectMake(row * width, loc * hight, width, hight);
        
    }
    [self connetNetWork];
}

-(void)connetNetWork{
    
    NSString *url = @"http://www.weather.com.cn/data/cityinfo/101010100.html";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //1.天气的信息
        NSDictionary *dic = responseObject;
        NSDictionary *weatherinfo = [dic objectForKey:@"weatherinfo"];
        YQLog(@"%@",weatherinfo);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
}
@end
