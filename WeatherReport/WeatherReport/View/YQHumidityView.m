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
    }
    return self;
}


-(void)layoutSubviews{
    self.lable.frame = CGRectMake(8, 8, 144, 30);
    
}
@end
