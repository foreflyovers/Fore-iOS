//
//  CoursesCollectionView.h
//  Fore
//
//  Created by pavan krishna on 28/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FOCourseCollectionViewCell.h"

@protocol CoursesCollectionViewDataSource <NSObject>

@end

@protocol CoursesCollectionViewDelegate <NSObject>

- (void)gotoCoursesScreen:(NSInteger)userID;

@end

@interface CoursesCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) NSMutableArray *cellCoursesArray;

@property (nonatomic, assign) id<CoursesCollectionViewDataSource> coursesCollectionViewDataSource;
@property (nonatomic, assign) id<CoursesCollectionViewDelegate> coursesCollectionViewDelegate;

@end
