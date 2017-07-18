//
//  SignUpDelegate.h
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FOFacebookLoginDelegate.h"
#import "FOFacebookService.h"
@class FOFacebookService;

@interface SignUpDelegate : NSObject<FOFacebookLoginDelegate>

@property (nonatomic, strong) FOFacebookService *facebookService;

+(id)sharedInstance;

-(void)signUp:(UIViewController *)controller;

@end
