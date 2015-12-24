//
//  RootViewController.m
//  WeatherReport
//
//  Created by YoKing on 15/12/6.
//  Copyright © 2015年 YQ. All rights reserved.
//

#import "RootViewController.h"
#import "YQRootView.h"
#import "GDataXMLNode.h"
#import "YQWeatherInfo.h"
@interface RootViewController ()<NSXMLParserDelegate>
@property (nonatomic,strong) YQRootView *root;
@property (nonatomic,strong) NSMutableArray *weather;
@property (nonatomic,strong) YQWeatherInfo *weatherInfo;
@property (nonatomic,strong) NSMutableString *currentElement;
@property (nonatomic,strong) NSString *currentTag;
@property (nonatomic,strong) NSMutableArray *weatherList;

@end

@implementation RootViewController

-(YQRootView *)root{
    if (!_root) {
        self.root = [[YQRootView alloc] init];
    }
    return _root;
}
-(NSMutableArray *)weather{
    if (!_weather) {
        self.weather = [[NSMutableArray alloc] init];
    }
    return _weather;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置rootView
    self.view = self.root;
    
    //获取数据
    [self paserXMl];
}

//解析xml文档
-(void)paserXMl{
    //获取网络天气数据
    NSURL *url = [NSURL URLWithString:@"http://php.weather.sina.com.cn/xml.php?city=%B1%B1%BE%A9&password=DJOYnieT8234jlsK&day=0"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        //数据错误 直接返回
        if (data == nil ||connectionError) {
            YQLog(@"网络错误");
            return ;
        }
        
        //1.初始化解析器
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
        
        //2.设置代理
        parser.delegate = self;
        
        //3.完成解析
        [parser parse];
        
        //4.刷新页面
        NSString *tem = [[self.weatherInfo.temperature1 stringByAppendingString:@" ~ "] stringByAppendingString:[self.weatherInfo.temperature2 substringWithRange:NSMakeRange(1, 2)]];
        
        self.root.cityView.testLable.text = self.weatherInfo.city;
        self.root.weatherView.testLable.text = [self.weatherInfo.status1 substringWithRange:NSMakeRange(1, 1)];
        self.root.temperatureView.testLable.text = tem;
        self.root.humidityView.testLable.text = [self.weatherInfo.status2 substringWithRange:NSMakeRange(1, 1)];
        self.root.particulateMatterView.testLable.text = [self.weatherInfo.udatetime substringFromIndex:11];
        self.root.windView.testLable.text = self.weatherInfo.power1;
        
        self.view = self.root;
        YQLog(@"%@---%@---%@---%@---%@---%@---",self.weatherInfo.city,self.weatherInfo.status1,tem,self.weatherInfo.status2,self.weatherInfo.udatetime,self.weatherInfo.power1);
    }];

}
//开始解析整个文档
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    
    self.weatherInfo = [[YQWeatherInfo alloc] init];
    self.weatherList = [[NSMutableArray alloc] init];
}
//准备开始解析子元素
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    self.currentTag = elementName;
}
//获取元素中的内容
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if (self.currentElement == nil) {
        self.currentElement = [[NSMutableString alloc] init];
    }
    
    if ([self.currentTag isEqualToString:@"city"] || [self.currentTag isEqualToString:@"status1"] || [self.currentTag isEqualToString:@"status2"] || [self.currentTag isEqualToString:@"udatetime"] || [self.currentTag isEqualToString:@"temperature1"] || [self.currentTag isEqualToString:@"temperature2"] || [self.currentTag isEqualToString:@"power1"]){
        
        [self.currentElement appendString:string];
    }
}
//结束解析子元素
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if ([elementName isEqualToString:@"Weather"]) {
        [self.weatherList addObject:self.weatherInfo];
    } if ([elementName isEqualToString:@"city"]) {
        self.weatherInfo.city = [self.currentElement copy];
    }else if ([elementName isEqualToString:@"status1"]) {
        self.weatherInfo.status1 = [self.currentElement copy];
    }else if ([elementName isEqualToString:@"status2"]) {
        self.weatherInfo.status2 = [self.currentElement copy];
    }else if ([elementName isEqualToString:@"udatetime"]) {
        self.weatherInfo.udatetime = [self.currentElement copy];
    }else if ([elementName isEqualToString:@"temperature1"]) {
        self.weatherInfo.temperature1 = [self.currentElement copy];
    }else if ([elementName isEqualToString:@"temperature2"]) {
        self.weatherInfo.temperature2 = [self.currentElement copy];
    }else if ([elementName isEqualToString:@"power1"]) {
        self.weatherInfo.power1 = [self.currentElement copy];
    }
    [self.currentElement setString:@""];
}
//结束解析整个文档
-(void)parserDidEndDocument:(NSXMLParser *)parser{
//    YQLog(@"---------parserDidEndDocument");
}

@end
