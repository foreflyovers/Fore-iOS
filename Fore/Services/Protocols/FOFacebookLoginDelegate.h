//
//  FOFacebookLoginDelegate.h
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FOFacebookLoginDelegate <NSObject>

-(void)facebookLoginDidSucceed:(NSDictionary *)details;
-(void)facebookLoginDidFail:(NSError *)error;

@end
