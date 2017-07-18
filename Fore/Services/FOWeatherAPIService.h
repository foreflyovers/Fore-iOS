//
//  FOWeatherAPIService.h
//  Fore
//
//  Created by pavan krishna on 04/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOBaseService.h"
#import "FOWeatherAPIRequest.h"

@interface FOWeatherAPIService : FOBaseService

+(id)sharedInstance;

-(void)getWeatherInfo:(NSDictionary *)params withCompletion:(ServiceCompletion)completionBlock;

@end
