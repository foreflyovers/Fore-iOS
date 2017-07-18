//
//  FOWeatherAPIService.m
//  Fore
//
//  Created by pavan krishna on 04/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOWeatherAPIService.h"
#import "SOLWeatherData.h"
#import "Climacons.h"
#import "NSString+Substring.h"

@implementation FOWeatherAPIService

+(id)sharedInstance;
{
    static FOWeatherAPIService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FOWeatherAPIService alloc] init];
        // Do any other initialisation stuff here
            

    });
    return sharedInstance;
}

-(void)getWeatherInfo:(NSDictionary *)params withCompletion:(ServiceCompletion)completionBlock;
{
    __weak typeof(self) weakSelf = self;

    [[FOWeatherAPIRequest sharedInstance] getWeatherInfo:params withCompletion:^(NSError *error, id results) {
        if (!error) {
            SOLWeatherData *weatherData = [self dataFromJSON:results];
                completionBlock(nil, weatherData);
        }
        else
        {
            completionBlock(error, nil);
        }
    }];
}

- (SOLWeatherData *)dataFromJSON:(NSDictionary *)JSON
{
    NSArray *currentObservation                 = [JSON             objectForKey:@"current_observation"];
    NSArray *forecast                           = [JSON             objectForKey:@"forecast"];
    NSArray *simpleforecast                     = [forecast         valueForKey:@"simpleforecast"];
    NSArray *forecastday                        = [simpleforecast   valueForKey:@"forecastday"];
    NSArray *forecastday0                       = [forecastday      objectAtIndex:0];
    NSArray *forecastday1                       = [forecastday      objectAtIndex:1];
    NSArray *forecastday2                       = [forecastday      objectAtIndex:2];
    NSArray *forecastday3                       = [forecastday      objectAtIndex:3];
    
    SOLWeatherData *data = [[SOLWeatherData alloc] init];
    
    SOLWeatherSnapshot *forecastOne             = [[SOLWeatherSnapshot alloc] init];
    CGFloat forecastOneHighTemperatureF             = [[[forecastday0 valueForKey:@"high"]  valueForKey:@"fahrenheit"] doubleValue];
    CGFloat forecastOneHighTemperatureC             = [[[forecastday0 valueForKey:@"high"]  valueForKey:@"celsius"] doubleValue];
    CGFloat forecastOneLowTemperatureF              = [[[forecastday0 valueForKey:@"low"]   valueForKey:@"fahrenheit"] doubleValue];
    CGFloat forecastOneLowTemperatureC              = [[[forecastday0 valueForKey:@"low"]   valueForKey:@"celsius"] doubleValue];
    forecastOne.highTemperature        = SOLTemperatureMake(forecastOneHighTemperatureF,   forecastOneHighTemperatureC);
    forecastOne.lowTemperature         = SOLTemperatureMake(forecastOneLowTemperatureF,    forecastOneLowTemperatureC);
    forecastOne.conditionDescription            = [forecastday0 valueForKey:@"conditions"];
    forecastOne.icon                            = [self iconForCondition:forecastOne.conditionDescription];
    forecastOne.dayOfWeek                       = [[forecastday0 valueForKey:@"date"] valueForKey:@"weekday"];
    forecastOne.averageWindSpeed                = [[[forecastday0 valueForKey:@"avewind"] valueForKey:@"mph"] floatValue];
    forecastOne.maxWindSpeed                    = [[[forecastday0 valueForKey:@"maxwind"] valueForKey:@"mph"] floatValue];
    [data.forecastSnapshots addObject:forecastOne];

    SOLWeatherSnapshot *forecastTwo             = [[SOLWeatherSnapshot alloc] init];
    CGFloat forecastTwoHighTemperatureF             = [[[forecastday1 valueForKey:@"high"]  valueForKey:@"fahrenheit"] doubleValue];
    CGFloat forecastTwoHighTemperatureC             = [[[forecastday1 valueForKey:@"high"]  valueForKey:@"celsius"] doubleValue];
    CGFloat forecastTwoLowTemperatureF              = [[[forecastday1 valueForKey:@"low"]   valueForKey:@"fahrenheit"] doubleValue];
    CGFloat forecastTwoLowTemperatureC              = [[[forecastday1 valueForKey:@"low"]   valueForKey:@"celsius"] doubleValue];
    forecastTwo.highTemperature        = SOLTemperatureMake(forecastTwoHighTemperatureF,   forecastTwoHighTemperatureC);
    forecastTwo.lowTemperature         = SOLTemperatureMake(forecastTwoLowTemperatureF,    forecastTwoLowTemperatureC);
    forecastTwo.conditionDescription            = [forecastday1 valueForKey:@"conditions"];
    forecastTwo.icon                            = [self iconForCondition:forecastTwo.conditionDescription];
    forecastTwo.dayOfWeek                       = [[forecastday1 valueForKey:@"date"] valueForKey:@"weekday"];
    forecastTwo.averageWindSpeed                = [[[forecastday1 valueForKey:@"avewind"] valueForKey:@"mph"] floatValue];
    forecastTwo.maxWindSpeed                    = [[[forecastday1 valueForKey:@"maxwind"] valueForKey:@"mph"] floatValue];

    [data.forecastSnapshots addObject:forecastTwo];
    
    SOLWeatherSnapshot *forecastThree             = [[SOLWeatherSnapshot alloc] init];
    CGFloat forecastThreeHighTemperatureF             = [[[forecastday2 valueForKey:@"high"]  valueForKey:@"fahrenheit"] doubleValue];
    CGFloat forecastThreeHighTemperatureC             = [[[forecastday2 valueForKey:@"high"]  valueForKey:@"celsius"] doubleValue];
    CGFloat forecastThreeLowTemperatureF              = [[[forecastday2 valueForKey:@"low"]   valueForKey:@"fahrenheit"] doubleValue];
    CGFloat forecastThreeLowTemperatureC              = [[[forecastday2 valueForKey:@"low"]   valueForKey:@"celsius"] doubleValue];
    forecastThree.highTemperature        = SOLTemperatureMake(forecastThreeHighTemperatureF,   forecastThreeHighTemperatureC);
    forecastThree.lowTemperature         = SOLTemperatureMake(forecastThreeLowTemperatureF,    forecastThreeLowTemperatureC);
    forecastThree.conditionDescription            = [forecastday2 valueForKey:@"conditions"];
    forecastThree.icon                            = [self iconForCondition:forecastThree.conditionDescription];
    forecastThree.dayOfWeek                       = [[forecastday2 valueForKey:@"date"] valueForKey:@"weekday"];
    forecastThree.averageWindSpeed                = [[[forecastday2 valueForKey:@"avewind"] valueForKey:@"mph"] floatValue];
    forecastThree.maxWindSpeed                    = [[[forecastday2 valueForKey:@"maxwind"] valueForKey:@"mph"] floatValue];

    [data.forecastSnapshots addObject:forecastThree];
    
    SOLWeatherSnapshot *forecastFour           = [[SOLWeatherSnapshot alloc] init];
    CGFloat forecastFourHighTemperatureF             = [[[forecastday3 valueForKey:@"high"]  valueForKey:@"fahrenheit"] doubleValue];
    CGFloat forecastFourHighTemperatureC             = [[[forecastday3 valueForKey:@"high"]  valueForKey:@"celsius"] doubleValue];
    CGFloat forecastFourLowTemperatureF              = [[[forecastday3 valueForKey:@"low"]   valueForKey:@"fahrenheit"] doubleValue];
    CGFloat forecastFourLowTemperatureC              = [[[forecastday3 valueForKey:@"low"]   valueForKey:@"celsius"] doubleValue];
    forecastFour.highTemperature        = SOLTemperatureMake(forecastFourHighTemperatureF,   forecastFourHighTemperatureC);
    forecastFour.lowTemperature         = SOLTemperatureMake(forecastFourLowTemperatureF,    forecastFourLowTemperatureC);
    forecastFour.conditionDescription          = [forecastday3 valueForKey:@"conditions"];
    forecastFour.icon                          = [self iconForCondition:forecastFour.conditionDescription];
    forecastFour.dayOfWeek                     = [[forecastday3 valueForKey:@"date"] valueForKey:@"weekday"];
    forecastFour.averageWindSpeed                = [[[forecastday3 valueForKey:@"avewind"] valueForKey:@"mph"] floatValue];
    forecastFour.maxWindSpeed                    = [[[forecastday3 valueForKey:@"maxwind"] valueForKey:@"mph"] floatValue];

    [data.forecastSnapshots addObject:forecastFour];
    
    data.timestamp = [NSDate date];
    
    return data;
}

- (NSString *)iconForCondition:(NSString *)condition
{
    NSString *iconName = [NSString stringWithFormat:@"%c", ClimaconSun];
    NSString *lowercaseCondition = [condition lowercaseString];
    
    if([lowercaseCondition contains:@"clear"]) {
        iconName = [NSString stringWithFormat:@"%c", ClimaconSun];
    } else if([lowercaseCondition contains:@"cloud"]) {
        iconName = [NSString stringWithFormat:@"%c", ClimaconCloud];
    } else if([lowercaseCondition contains:@"drizzle"]  ||
              [lowercaseCondition contains:@"rain"]     ||
              [lowercaseCondition contains:@"thunderstorm"]) {
        iconName = [NSString stringWithFormat:@"%c", ClimaconRain];
    } else if([lowercaseCondition contains:@"snow"]     ||
              [lowercaseCondition contains:@"hail"]     ||
              [lowercaseCondition contains:@"ice"]) {
        iconName = [NSString stringWithFormat:@"%c", ClimaconSnow];
    } else if([lowercaseCondition contains:@"fog"]      ||
              [lowercaseCondition contains:@"overcast"] ||
              [lowercaseCondition contains:@"smoke"]    ||
              [lowercaseCondition contains:@"dust"]     ||
              [lowercaseCondition contains:@"ash"]      ||
              [lowercaseCondition contains:@"mist"]     ||
              [lowercaseCondition contains:@"haze"]     ||
              [lowercaseCondition contains:@"spray"]    ||
              [lowercaseCondition contains:@"squall"]) {
        iconName = [NSString stringWithFormat:@"%c", ClimaconHaze];
    }
    return iconName;
}

@end
