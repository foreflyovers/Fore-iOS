//
//  OverViewComponent.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "OverViewComponent.h"

#import "ParInfoComponent.h"
#import "CourseInfoComponent.h"
#import "AmenitiesComponent.h"
#import "MapInfoComponent.h"
#import "WeatherInfoComponent.h"
#import "OverviewVideoComponent.h"
#import "CallProShopComponent.h"
#import "SOLWeatherData.h"
#import "FOWeatherAPIService.h"

@interface OverViewComponent()

@property (nonatomic, strong) LayoutManager *layoutManager;
@property (nonatomic, strong) UITableView *overViewTableView;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation OverViewComponent

-(void)viewDidLoad;
{
    [super viewDidLoad];
    
    NSLog(@"_weatherModel:%@",_weatherModel);
    
    self.layoutManager = [[LayoutManager alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubviews];
    [self updateConstraints];

    [[self overViewTableView] registerClass:[ParInfoComponent class] forCellReuseIdentifier:@"parInfoCellIdentifier"];
    [[self overViewTableView] registerClass:[CourseInfoComponent class] forCellReuseIdentifier:@"courseInfoCellIdentifier"];
    [[self overViewTableView] registerClass:[AmenitiesComponent class] forCellReuseIdentifier:@"amenitiesCellIdentifier"];
    [[self overViewTableView] registerClass:[MapInfoComponent class] forCellReuseIdentifier:@"mapInfoCellIdentifier"];
    [[self overViewTableView] registerClass:[WeatherInfoComponent class] forCellReuseIdentifier:@"weatherInfoCellIdentifier"];
    [[self overViewTableView] registerClass:[OverviewVideoComponent class] forCellReuseIdentifier:@"overviewVideoCellIdentifier"];
    [[self overViewTableView] registerClass:[CallProShopComponent class] forCellReuseIdentifier:@"callProShopCellIdentifier"];
}

-(void)addSubviews;
{
    [self.view addSubview:[self overViewTableView]];
}

-(void)updateConstraints;
{
    [[self overViewTableView] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.height.equalTo(@([self.layoutManager height:75]));
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    NSInteger rowValue = indexPath.row;
    switch (rowValue) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"parInfoCellIdentifier"];
            [(ParInfoComponent*)cell setParInfo:@"00"];
            [(ParInfoComponent*)cell setSlopeInfo:@"000"];
            [(ParInfoComponent*)cell setRatingInfo:@"00"];
            [(ParInfoComponent*)cell setLengthInfo:@"0000"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"courseInfoCellIdentifier"];
            [(CourseInfoComponent*)cell setInfoContent:@"Info about course"];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"amenitiesCellIdentifier"];
//            [(AmenitiesComponent*)cell setDummyName:@"Dummy text"];
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"mapInfoCellIdentifier"];
//            [(MapInfoComponent*)cell setDummyName:@"Dummy text"];
            break;
        case 4:
            cell = [tableView dequeueReusableCellWithIdentifier:@"weatherInfoCellIdentifier"];
            
            [self updateCellData:(WeatherInfoComponent*)cell andWithData:self.weatherModel];
            break;
        case 5:
            cell = [tableView dequeueReusableCellWithIdentifier:@"overviewVideoCellIdentifier"];
            [(OverviewVideoComponent *)cell setDelegate:self];
//            [(OverviewVideoComponent*)cell setDummyName:@"Video Component"];
            break;
        case 6:
            cell = [tableView dequeueReusableCellWithIdentifier:@"callProShopCellIdentifier"];
            [(CallProShopComponent*)cell setCallText:@"Call Pro Shop"];
            [(CallProShopComponent*)cell setCellImage:@"call_image"];
            break;
        case 7:
            cell = [tableView dequeueReusableCellWithIdentifier:@"callProShopCellIdentifier"];
            [(CallProShopComponent*)cell setCallText:@"Visit Website"];
            [(CallProShopComponent*)cell setCellImage:@"visit_website_image"];
            break;
        default:
            break;
            
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSInteger rowValue = indexPath.row;
    NSInteger rowHeight = 0;
    switch (rowValue) {
        case 0:
            rowHeight = 80;
            break;
        case 1:
            rowHeight = 100;
            break;
        case 2:
            rowHeight = 100;
            break;
        case 3:
            rowHeight = 160;
            break;
        case 4:
            rowHeight = [[self layoutManager] height:25];
            break;
        case 5:
            rowHeight = [[self layoutManager] height:26.4];
            break;
        case 6:
            rowHeight = 80;
            break;
        case 7:
            rowHeight = 80;
            break;
        default:
            break;
            
    }

    return rowHeight;
}

#pragma mark - Lazy Loading

-(UITableView *)overViewTableView;
{
    if (_overViewTableView) {
        return _overViewTableView;
    }
    
    _overViewTableView = [UITableView new];
    //    [[_overViewTableView layer] setBorderColor:[UIColor brownColor].CGColor];
    //    [[_overViewTableView layer] setBorderWidth:1];
    [_overViewTableView setDataSource:self];
    [_overViewTableView setDelegate:self];
    [_overViewTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [_overViewTableView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [_overViewTableView setBackgroundColor:[UIColor clearColor]];
    
    return _overViewTableView;
}

//- (void)updateWeatherViewWithData:(SOLWeatherData *)data;
//{
//    self.dateFormatter = [[NSDateFormatter alloc] init];
//    [self.dateFormatter setDateFormat:@"day"];
//
//    self.weatherModel = data;
////    [[self overViewTableView] reloadData];
//}

- (void)updateCellData:(WeatherInfoComponent *)cell andWithData:(SOLWeatherData *)data;
{
    SOLWeatherSnapshot *forecastDayOneSnapshot      = [data.forecastSnapshots objectAtIndex:0];
    SOLWeatherSnapshot *forecastDayTwoSnapshot      = [data.forecastSnapshots objectAtIndex:1];
    SOLWeatherSnapshot *forecastDayThreeSnapshot    = [data.forecastSnapshots objectAtIndex:2];
    SOLWeatherSnapshot *forecastDayFourSnapshot     = [data.forecastSnapshots objectAtIndex:3];
    
    NSString *firstTemperatureText = [NSString stringWithFormat:@"%.0f/%.0f F",forecastDayOneSnapshot.highTemperature.fahrenheit,forecastDayOneSnapshot.lowTemperature.fahrenheit];
    [(WeatherInfoComponent*)cell setFirstWeatherIcon:forecastDayOneSnapshot.icon];
    [(WeatherInfoComponent*)cell setFirstWeatherDay:[forecastDayOneSnapshot.dayOfWeek substringWithRange:NSMakeRange(0, 3)]];
    [(WeatherInfoComponent*)cell setFirstWeatherTemperature:firstTemperatureText];

    NSString *secondTemperatureText = [NSString stringWithFormat:@"%.0f/%.0f F",forecastDayTwoSnapshot.highTemperature.fahrenheit,forecastDayTwoSnapshot.lowTemperature.fahrenheit];
    [(WeatherInfoComponent*)cell setSecondWeatherIcon:forecastDayTwoSnapshot.icon];
    [(WeatherInfoComponent*)cell setSecondWeatherDay:[forecastDayTwoSnapshot.dayOfWeek substringWithRange:NSMakeRange(0, 3)]];
    [(WeatherInfoComponent*)cell setSecondWeatherTemperature:secondTemperatureText];

    NSString *thirdTemperatureText = [NSString stringWithFormat:@"%.0f/%.0f F",forecastDayThreeSnapshot.highTemperature.fahrenheit,forecastDayThreeSnapshot.lowTemperature.fahrenheit];
    [(WeatherInfoComponent*)cell setThirdWeatherIcon:forecastDayThreeSnapshot.icon];
    [(WeatherInfoComponent*)cell setThirdWeatherDay:[forecastDayThreeSnapshot.dayOfWeek substringWithRange:NSMakeRange(0, 3)]];
    [(WeatherInfoComponent*)cell setThirdWeatherTemperature:thirdTemperatureText];

    NSString *fourthTemperatureText = [NSString stringWithFormat:@"%.0f/%.0f F",forecastDayFourSnapshot.highTemperature.fahrenheit,forecastDayFourSnapshot.lowTemperature.fahrenheit];
    [(WeatherInfoComponent*)cell setFourthWeatherIcon:forecastDayFourSnapshot.icon];
    [(WeatherInfoComponent*)cell setFourthWeatherDay:[forecastDayFourSnapshot.dayOfWeek substringWithRange:NSMakeRange(0, 3)]];
    [(WeatherInfoComponent*)cell setFourthWeatherTemperature:fourthTemperatureText];
    
    [(WeatherInfoComponent*)cell setFirstWeatherSpeed:[NSString stringWithFormat:@"%.0f mph",forecastDayOneSnapshot.averageWindSpeed]];
    [(WeatherInfoComponent*)cell setSecondWeatherSpeed:[NSString stringWithFormat:@"%.0f mph",forecastDayTwoSnapshot.averageWindSpeed]];
    [(WeatherInfoComponent*)cell setThirdWeatherSpeed:[NSString stringWithFormat:@"%.0f mph",forecastDayThreeSnapshot.averageWindSpeed]];
    [(WeatherInfoComponent*)cell setFourthWeatherSpeed:[NSString stringWithFormat:@"%.0f mph",forecastDayFourSnapshot.averageWindSpeed]];
}

- (void)playerWillEnterFullscreen;
{
    [[self navigationController] setNavigationBarHidden:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
}

- (void)playerWillLeaveFullscreen;
{
    [[self navigationController] setNavigationBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
}

- (void)playerDidEndPlaying;
{
    
}

- (void)playerFailedToPlayToEnd;
{
    
}

@end
