//
//  WeatherInfoView.h
//  Fore
//
//  Created by pavan krishna on 04/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherInfoView : UIView

-(void)setFirstWeatherIcon:(NSString *)icon;
-(void)setFirstWeatherDay:(NSString *)day;
-(void)setFirstWeatherTemperature:(NSString *)temperature;
-(void)setFirstWeatherSpeed:(NSString *)speed;

-(void)setSecondWeatherIcon:(NSString *)icon;
-(void)setSecondWeatherDay:(NSString *)day;
-(void)setSecondWeatherTemperature:(NSString *)temperature;
-(void)setSecondWeatherSpeed:(NSString *)speed;

-(void)setThirdWeatherIcon:(NSString *)icon;
-(void)setThirdWeatherDay:(NSString *)day;
-(void)setThirdWeatherTemperature:(NSString *)temperature;
-(void)setThirdWeatherSpeed:(NSString *)speed;

-(void)setFourthWeatherIcon:(NSString *)icon;
-(void)setFourthWeatherDay:(NSString *)day;
-(void)setFourthWeatherTemperature:(NSString *)temperature;
-(void)setFourthWeatherSpeed:(NSString *)speed;

@end
