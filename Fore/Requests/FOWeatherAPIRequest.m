//
//  FOWeatherAPIRequest.m
//  Fore
//
//  Created by pavan krishna on 04/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOWeatherAPIRequest.h"

@implementation FOWeatherAPIRequest

+(id)sharedInstance;
{
    static FOWeatherAPIRequest *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FOWeatherAPIRequest alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

-(void)getWeatherInfo:(NSDictionary *)params withCompletion:(RequestCompletion)completionBlock;
{
    NSString *apiKey = @"684cc81d21cfb251";
    
    CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake(46.829438199999998, -100.95707830000001);
    
    static NSString *baseURL =  @"http://api.wunderground.com/api/";
    static NSString *parameters = @"/forecast/conditions/q/";
    NSString *requestURL = [NSString stringWithFormat:@"%@%@%@%f,%f.json", baseURL, apiKey, parameters,
                            coordinates.latitude, coordinates.longitude];
    NSURL *url = [NSURL URLWithString:requestURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    __weak typeof(self) weakSelf = self;
    [self GETForWeather:requestURL withParams:nil withCompletionBlock:^(NSError *error, id results) {
        if (error) {
            completionBlock(error, nil);
        } else {
            completionBlock(nil, results);
        }
    }];
}
@end


