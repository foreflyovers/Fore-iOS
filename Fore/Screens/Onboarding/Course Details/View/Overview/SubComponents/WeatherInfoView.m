//
//  WeatherInfoView.m
//  Fore
//
//  Created by pavan krishna on 04/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "WeatherInfoView.h"
#import <Masonry/Masonry.h>
#import "Masonry.h"
#import "LayoutManager.h"

@interface WeatherInfoView()

@property (nonatomic, strong) LayoutManager *layoutManager;

//@property (nonatomic, strong) UIImageView *weatherIcon;
@property (nonatomic, strong) UILabel *weatherIcon;

@property (nonatomic, strong) UILabel *dayInfoLabel;
@property (nonatomic, strong) UILabel *tempertatureInfoLabel;
@property (nonatomic, strong) UILabel *speedInfoLabel;

@end

@implementation WeatherInfoView

-(id)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.layoutManager = [[LayoutManager alloc] init];
        [self addSubViews];
        [self setNeedsLayout];
        [self updateConstraints];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

-(void)addSubViews;
{
    [self addSubview:[self weatherIcon]];
    [self addSubview:[self dayInfoLabel]];
    [self addSubview:[self tempertatureInfoLabel]];
    [self addSubview:[self speedInfoLabel]];
}

-(void)updateConstraints;
{
    NSLog(@"width:%f",self.frame.size.width);
    NSLog(@"height:%f",self.frame.size.height);
    
    [[self weatherIcon] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset([self.layoutManager height:3]);
        make.height.equalTo(@([self.layoutManager height:10]));
        make.left.equalTo(self);
        make.right.equalTo(self);
    }];
    
    [[self dayInfoLabel] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.weatherIcon.mas_bottom);
        make.height.equalTo(@([self.layoutManager height:3]));
        make.left.equalTo(self);
        make.right.equalTo(self);
    }];

    [[self tempertatureInfoLabel] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dayInfoLabel.mas_bottom);
        make.height.equalTo(@([self.layoutManager height:3]));
        make.left.equalTo(self);
        make.right.equalTo(self);
    }];

    [[self speedInfoLabel] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tempertatureInfoLabel.mas_bottom);
        make.height.equalTo(@([self.layoutManager height:3]));
        make.left.equalTo(self);
        make.right.equalTo(self);
    }];
    
    [super updateConstraints];
}

-(UILabel*)newLabel;
{
    UILabel *label = [UILabel new];
//    [[label layer] setBorderColor:[UIColor redColor].CGColor];
//    [[label layer] setBorderWidth:1];
    [label setTextColor:[UIColor darkGrayColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    return label;
}

-(UILabel *)weatherIcon;
{
    if (_weatherIcon) {
        return _weatherIcon;
    }
    
    _weatherIcon = [UILabel new];
    [_weatherIcon setTextAlignment:NSTextAlignmentCenter];
    if IS_IPHONE_5
    {
        [_weatherIcon setFont:[UIFont fontWithName:@"Climacons-Font" size:50]];
    }
    else if (IS_IPHONE_6P)
    {
        [_weatherIcon setFont:[UIFont fontWithName:@"Climacons-Font" size:80]];
    }
    else if (IS_IPHONE_6)
    {
        [_weatherIcon setFont:[UIFont fontWithName:@"Climacons-Font" size:60]];
    }
    else if (IS_IPHONE_4_OR_LESS)
    {
        [_weatherIcon setFont:[UIFont fontWithName:@"Climacons-Font" size:30]];
    }
    return _weatherIcon;
}

-(UILabel *)dayInfoLabel;
{
    if (_dayInfoLabel) {
        return _dayInfoLabel;
    }
    
    _dayInfoLabel = [self newLabel];
    if IS_IPHONE_5
    {
        [_dayInfoLabel setFont:[UIFont boldSystemFontOfSize:14]];
    }
    else if (IS_IPHONE_6P)
    {
        [_dayInfoLabel setFont:[UIFont boldSystemFontOfSize:18]];
    }
    else if (IS_IPHONE_6)
    {
        [_dayInfoLabel setFont:[UIFont boldSystemFontOfSize:16]];
    }
    else if (IS_IPHONE_4_OR_LESS)
    {
        [_dayInfoLabel setFont:[UIFont systemFontOfSize:12]];
    }
    [_dayInfoLabel setTextColor:[UIColor darkGrayColor]];
    return _dayInfoLabel;
}

-(UILabel *)tempertatureInfoLabel;
{
    if (_tempertatureInfoLabel) {
        return _tempertatureInfoLabel;
    }
    
    _tempertatureInfoLabel = [self newLabel];
    if IS_IPHONE_5
    {
        [_tempertatureInfoLabel setFont:[UIFont systemFontOfSize:12]];
    }
    else if (IS_IPHONE_6P)
    {
        [_tempertatureInfoLabel setFont:[UIFont systemFontOfSize:18]];
    }
    else if (IS_IPHONE_6)
    {
        [_tempertatureInfoLabel setFont:[UIFont systemFontOfSize:16]];
    }
    else if (IS_IPHONE_4_OR_LESS)
    {
        [_tempertatureInfoLabel setFont:[UIFont systemFontOfSize:10]];
    }
    [_tempertatureInfoLabel setTextColor:[UIColor darkGrayColor]];
    return _tempertatureInfoLabel;
}

-(UILabel *)speedInfoLabel;
{
    if (_speedInfoLabel) {
        return _speedInfoLabel;
    }
    
    _speedInfoLabel = [self newLabel];
    if IS_IPHONE_5
    {
        [_speedInfoLabel setFont:[UIFont systemFontOfSize:11]];
    }
    else if (IS_IPHONE_6P)
    {
        [_speedInfoLabel setFont:[UIFont systemFontOfSize:18]];
    }
    else if (IS_IPHONE_6)
    {
        [_speedInfoLabel setFont:[UIFont systemFontOfSize:15]];
    }
    else if (IS_IPHONE_4_OR_LESS)
    {
        [_speedInfoLabel setFont:[UIFont systemFontOfSize:9]];
    }
    [_speedInfoLabel setTextColor:[UIColor darkGrayColor]];
    return _speedInfoLabel;
}

-(void)setFirstWeatherIcon:(NSString *)icon;
{
    [[self weatherIcon] setText:icon];
}

-(void)setFirstWeatherDay:(NSString *)day;
{
    [[self dayInfoLabel] setText:day];
}

-(void)setFirstWeatherTemperature:(NSString *)temperature;
{
    [[self tempertatureInfoLabel] setText:temperature];
}

-(void)setFirstWeatherSpeed:(NSString *)speed;
{
    [[self speedInfoLabel] setText:speed];
}

-(void)setSecondWeatherIcon:(NSString *)icon;
{
    [[self weatherIcon] setText:icon];
}

-(void)setSecondWeatherDay:(NSString *)day;
{
    [[self dayInfoLabel] setText:day];
}

-(void)setSecondWeatherTemperature:(NSString *)temperature;
{
    [[self tempertatureInfoLabel] setText:temperature];
}

-(void)setSecondWeatherSpeed:(NSString *)speed;
{
    [[self speedInfoLabel] setText:speed];
}

-(void)setThirdWeatherIcon:(NSString *)icon;
{
    [[self weatherIcon] setText:icon];
}

-(void)setThirdWeatherDay:(NSString *)day;
{
    [[self dayInfoLabel] setText:day];
}

-(void)setThirdWeatherTemperature:(NSString *)temperature;
{
    [[self tempertatureInfoLabel] setText:temperature];
}

-(void)setThirdWeatherSpeed:(NSString *)speed;
{
    [[self speedInfoLabel] setText:speed];
}

-(void)setFourthWeatherIcon:(NSString *)icon;
{
    [[self weatherIcon] setText:icon];
}

-(void)setFourthWeatherDay:(NSString *)day;
{
    [[self dayInfoLabel] setText:day];
}

-(void)setFourthWeatherTemperature:(NSString *)temperature;
{
    [[self tempertatureInfoLabel] setText:temperature];
}

-(void)setFourthWeatherSpeed:(NSString *)speed;
{
    [[self speedInfoLabel] setText:speed];
}


@end
