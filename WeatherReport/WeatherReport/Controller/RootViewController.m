//
//  RootViewController.m
//  WeatherReport
//
//  Created by YoKing on 15/12/6.
//  Copyright © 2015年 YQ. All rights reserved.
//

#import "RootViewController.h"
#import "YQRootView.h"
#import "AFNetworking.h"
#import "YQCityView.h"
@interface RootViewController ()
@property (nonatomic,strong) YQRootView *root;
@end

@implementation RootViewController

-(YQRootView *)root{
    if (!_root) {
        self.root = [[YQRootView alloc] init];
    }
    return _root;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = self.root;
//    [self connetNetWork];
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
