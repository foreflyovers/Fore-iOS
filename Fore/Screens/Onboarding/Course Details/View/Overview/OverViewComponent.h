//
//  OverViewComponent.h
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SOLWeatherData.h"
#import "OverviewVideoComponent.h"

@protocol OverViewComponentDataSource <NSObject>

@end

@protocol OverViewComponentDelegate <NSObject>

- (void)playerWillEnterFullscreen;
- (void)playerWillLeaveFullscreen;
- (void)playerDidEndPlaying;
- (void)playerFailedToPlayToEnd;

@end

@interface OverViewComponent : UIViewController<UITableViewDataSource,UITableViewDelegate,OverviewVideoComponentDelegate>

@property (nonatomic, assign) id<OverViewComponentDataSource> dataSource;
@property (nonatomic, assign) id<OverViewComponentDelegate> delegate;

@property (nonatomic, strong) SOLWeatherData *weatherModel;

//- (void)updateWeatherViewWithData:(SOLWeatherData *)data;

@end
