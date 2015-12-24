//
//  YQHumidityView.m
//  WeatherReport
//
//  Created by YoKing on 15/12/8.
//  Copyright © 2015年 YQ. All rights reserved.
//

#import "YQHumidityView.h"

@interface YQHumidityView()

@property (nonatomic,weak) UILabel *lable;
@end

@implementation YQHumidityView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *lable = [[UILabel alloc] init];
        lable.backgroundColor = [UIColor clearColor];
        lable.text = @"Humidity";
        lable.font = [UIFont systemFontOfSize:18.0];
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
