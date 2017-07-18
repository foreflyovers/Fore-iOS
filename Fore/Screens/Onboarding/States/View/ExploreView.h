//
//  ExploreView.h
//  Fore
//
//  Created by pavan krishna on 28/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FOStateCollectionViewCell.h"
#import "StatesCollectionView.h"
#import "CoursesCollectionView.h"

@protocol ExploreViewDataSource <NSObject>

@end

@protocol ExploreViewDelegate <NSObject>

- (void)gotoCoursesScreen:(NSInteger)userID;

@end

@interface ExploreView : UIView<StatesCollectionViewDataSource,StatesCollectionViewDelegate,CoursesCollectionViewDataSource,CoursesCollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *statesArray;
@property (nonatomic, strong) StatesCollectionView *statesCollectionView;
@property (nonatomic, strong) CoursesCollectionView *coursesCollectionView;
@property (nonatomic, strong) UILabel *featuredDestinationsTitle;
@property (nonatomic, strong) UILabel *coursesInStateTitle;
@property (nonatomic, strong) UIView *topLineView;
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, assign) id<ExploreViewDataSource> dataSource;
@property (nonatomic, assign) id<ExploreViewDelegate> delegate;

-(void)reloadStatesCollectionView;

@end
