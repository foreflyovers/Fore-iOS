//
//  WeatherInfoComponent.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "WeatherInfoComponent.h"
#import "WeatherInfoView.h"

@interface WeatherInfoComponent ()

@property (nonatomic, strong) WeatherInfoView *firstWeatherView;
@property (nonatomic, strong) WeatherInfoView *secondWeatherView;
@property (nonatomic, strong) WeatherInfoView *thirdWeatherView;
@property (nonatomic, strong) WeatherInfoView *fourthWeatherView;

@end

@implementation WeatherInfoComponent

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        [[self layer] setBorderColor:[UIColor redColor].CGColor];
//        [[self layer] setBorderWidth:1];

        [self addSubviews];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

-(void)prepareForReuse;
{
    [super prepareForReuse];
}

-(void)addSubviews;
{
    [[self contentView] addSubview:[self firstWeatherView]];
    [[self contentView] addSubview:[self secondWeatherView]];
    [[self contentView] addSubview:[self thirdWeatherView]];
    [[self contentView] addSubview:[self fourthWeatherView]];
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    
    CGFloat screenWidth = [[self contentView] frame].size.width;
    CGFloat screenHeight = [[self contentView] frame].size.height;
    
    [[self firstWeatherView] setFrame:CGRectMake((screenWidth * 4)/100,
                                            0,
                                            (screenWidth * 20)/100,
                                            (screenHeight * 100)/100)];
    
    [[self secondWeatherView] setFrame:CGRectMake(CGRectGetMaxX([[self firstWeatherView] frame])+(screenWidth * 4)/100,
                                                 0,
                                                 (screenWidth * 20)/100,
                                                 (screenHeight * 100)/100)];
    
    [[self thirdWeatherView] setFrame:CGRectMake(CGRectGetMaxX([[self secondWeatherView] frame])+(screenWidth * 4)/100,
                                                 0,
                                                 (screenWidth * 20)/100,
                                                 (screenHeight * 100)/100)];
    
    [[self fourthWeatherView] setFrame:CGRectMake(CGRectGetMaxX([[self thirdWeatherView] frame])+(screenWidth * 4)/100,
                                                 0,
                                                 (screenWidth * 20)/100,
                                                 (screenHeight * 100)/100)];
}

-(WeatherInfoView*)firstWeatherView;
{
    if (_firstWeatherView) {
        return _firstWeatherView;
    }
    
    _firstWeatherView = [[WeatherInfoView alloc] initWithFrame:CGRectZero];
    [_firstWeatherView setBackgroundColor:[UIColor whiteColor]];
//    [[_firstWeatherView layer] setBorderColor:[UIColor blackColor].CGColor];
//    [[_firstWeatherView layer] setBorderWidth:1];
    [_firstWeatherView setTag:1];
    
    return _firstWeatherView;
}

-(WeatherInfoView*)secondWeatherView;
{
    if (_secondWeatherView) {
        return _secondWeatherView;
    }
    
    _secondWeatherView = [[WeatherInfoView alloc] initWithFrame:CGRectZero];
    [_secondWeatherView setBackgroundColor:[UIColor whiteColor]];
//    [[_secondWeatherView layer] setBorderColor:[UIColor blackColor].CGColor];
//    [[_secondWeatherView layer] setBorderWidth:1];
    [_firstWeatherView setTag:2];
    
    return _secondWeatherView;
}

-(WeatherInfoView*)thirdWeatherView;
{
    if (_thirdWeatherView) {
        return _thirdWeatherView;
    }
    
    _thirdWeatherView = [[WeatherInfoView alloc] initWithFrame:CGRectZero];
    [_thirdWeatherView setBackgroundColor:[UIColor whiteColor]];
//    [[_thirdWeatherView layer] setBorderColor:[UIColor blackColor].CGColor];
//    [[_thirdWeatherView layer] setBorderWidth:1];
    [_thirdWeatherView setTag:3];

    return _thirdWeatherView;
}

-(WeatherInfoView*)fourthWeatherView;
{
    if (_fourthWeatherView) {
        return _fourthWeatherView;
    }
    
    _fourthWeatherView = [[WeatherInfoView alloc] initWithFrame:CGRectZero];
    [_fourthWeatherView setBackgroundColor:[UIColor whiteColor]];
//    [[_fourthWeatherView layer] setBorderColor:[UIColor blackColor].CGColor];
//    [[_fourthWeatherView layer] setBorderWidth:1];
    [_fourthWeatherView setTag:4];

    return _fourthWeatherView;
}

-(void)setFirstWeatherIcon:(NSString *)icon;
{
    [[self firstWeatherView] setFirstWeatherIcon:icon];
}

-(void)setFirstWeatherDay:(NSString *)day;
{
    [[self firstWeatherView] setFirstWeatherDay:day];
}

-(void)setFirstWeatherTemperature:(NSString *)temperature;
{
    [[self firstWeatherView] setFirstWeatherTemperature:temperature];
}

-(void)setFirstWeatherSpeed:(NSString *)speed;
{
    [[self firstWeatherView] setFirstWeatherSpeed:speed];
}

-(void)setSecondWeatherIcon:(NSString *)icon;
{
    [[self secondWeatherView] setSecondWeatherIcon:icon];
}

-(void)setSecondWeatherDay:(NSString *)day;
{
    [[self secondWeatherView] setSecondWeatherDay:day];
}

-(void)setSecondWeatherTemperature:(NSString *)temperature;
{
    [[self secondWeatherView] setSecondWeatherTemperature:temperature];
}

-(void)setSecondWeatherSpeed:(NSString *)speed;
{
    [[self secondWeatherView] setSecondWeatherSpeed:speed];
}

-(void)setThirdWeatherIcon:(NSString *)icon;
{
    [[self thirdWeatherView] setThirdWeatherIcon:icon];
}

-(void)setThirdWeatherDay:(NSString *)day;
{
    [[self thirdWeatherView] setThirdWeatherDay:day];
}

-(void)setThirdWeatherTemperature:(NSString *)temperature;
{
    [[self thirdWeatherView] setThirdWeatherTemperature:temperature];
}

-(void)setThirdWeatherSpeed:(NSString *)speed;
{
    [[self thirdWeatherView] setThirdWeatherSpeed:speed];
}

-(void)setFourthWeatherIcon:(NSString *)icon;
{
    [[self fourthWeatherView] setFourthWeatherIcon:icon];
}

-(void)setFourthWeatherDay:(NSString *)day;
{
    [[self fourthWeatherView] setFourthWeatherDay:day];
}

-(void)setFourthWeatherTemperature:(NSString *)temperature;
{
    [[self fourthWeatherView] setFourthWeatherTemperature:temperature];
}

-(void)setFourthWeatherSpeed:(NSString *)speed;
{
    [[self fourthWeatherView] setFourthWeatherSpeed:speed];
}
@end


