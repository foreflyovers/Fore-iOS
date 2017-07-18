//
//  FOWeatherAPIRequest.h
//  Fore
//
//  Created by pavan krishna on 04/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOBaseRequest.h"
#import <CoreLocation/CoreLocation.h>
@interface FOWeatherAPIRequest : FOBaseRequest

+(id)sharedInstance;

-(void)getWeatherInfo:(NSDictionary *)params withCompletion:(RequestCompletion)completionBlock;

@end
