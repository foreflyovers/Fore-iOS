//
//  SignUpDelegate.m
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "SignUpDelegate.h"

static SignUpDelegate *sharedInstance = nil;

@implementation SignUpDelegate

+(id)sharedInstance;
{
    static SignUpDelegate *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SignUpDelegate alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}
-(void)signUp:(UIViewController *)controller;
{
    self.facebookService = [FOFacebookService sharedInstance];
    [[self facebookService] setFacebookLoginDelegate:self];
    [[self facebookService] login:controller];
}

-(void)facebookLoginDidFail:(NSError *)error;
{

}

-(void)facebookLoginDidSucceed:(NSDictionary *)details;
{
    NSLog(@"Details:%@",details);
    [self login:details];
}

-(void)login:(NSDictionary *)userDetails;
{
    
}

@end
