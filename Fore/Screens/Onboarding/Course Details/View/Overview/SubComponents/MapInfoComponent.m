//
//  MapInfoComponent.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "MapInfoComponent.h"
#import <MapKit/MapKit.h>

@interface MapInfoComponent ()

@property (nonatomic, strong) MKMapView *courseMapView;

@end

@implementation MapInfoComponent

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubviews];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

-(void)prepareForReuse;
{
    [super prepareForReuse];
}

-(void)addSubviews;
{
    [[self contentView] addSubview:[self courseMapView]];
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    
    [[self courseMapView] setFrame:CGRectMake(0, 0, CGRectGetWidth([[self contentView] frame]), CGRectGetHeight([[self contentView] frame]))];

    [[self textLabel] sizeToFit];
}

-(MKMapView *)courseMapView;
{
    if (_courseMapView) {
        return _courseMapView;
    }
    
    _courseMapView = [[MKMapView alloc] init];
    
    return _courseMapView;
}

-(void)setCourseLocation:(CLLocation *)courseLocation;
{
//    [[self courseMapView] setl];
}

@end

