//
//  MapInfoComponent.h
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapInfoComponent : UITableViewCell

-(void)setCourseLocation:(CLLocation *)courseLocation;

@end
