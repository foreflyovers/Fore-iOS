//
//  FOCourseDetailsView.h
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HeaderVideoOverlayComponent.h"

#import "OverViewComponent.h"
#import "HoleByHoleComponent.h"
#import "ReviewsComponent.h"
#import "SOLWeatherData.h"

@protocol FOCourseDetailsViewDataSource <NSObject>

@end

@protocol FOCourseDetailsViewDelegate <NSObject>

@end

@interface FOCourseDetailsView : UIScrollView<FOCourseDetailsViewDataSource,FOCourseDetailsViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *statesArray;

@property (nonatomic, strong) HeaderVideoOverlayComponent *headerVideoOverlayComponent;

@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@property (nonatomic, strong) OverViewComponent *overViewComponent;
@property (nonatomic, strong) HoleByHoleComponent *holeByHoleComponent;
@property (nonatomic, strong) ReviewsComponent *reviewsComponent;

@property (nonatomic, assign) id<FOCourseDetailsViewDataSource> dataSource;
@property (nonatomic, assign) id<FOCourseDetailsViewDelegate> delegate;

- (void)updateWeatherViewWithData:(SOLWeatherData *)data;

-(void)reloadOverviewTableView;
-(void)reloadHolesTableView;
-(void)reloadReviewsTableView;

@end
