//
//  YQCityView.m
//  WeatherReport
//
//  Created by YoKing on 15/12/7.
//  Copyright © 2015年 YQ. All rights reserved.
//  城市模块

#import "YQCityView.h"
#import "YQWeatherInfo.h"
@interface YQCityView()
@property (nonatomic,weak) UILabel *lable;
@end


@implementation YQCityView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //1.设置模块标题
        UILabel *lable = [[UILabel alloc] init];
        lable.backgroundColor = [UIColor clearColor];
        lable.text = @"City";
        lable.font = [UIFont fontWithName:@"Lato-Light" size:14];
        [self addSubview:lable];
        self.lable = lable;
        
        UILabel *testLable = [[UILabel alloc] init];
        [self addSubview:testLable];
        self.testLable = testLable;
    }
    return self;
}


-(void)layoutSubviews{
    self.lable.frame = CGRectMake(8, 8, 144, 30);
    self.testLable.frame = CGRectMake(8, 80, 144, 30);
    
}
@end
