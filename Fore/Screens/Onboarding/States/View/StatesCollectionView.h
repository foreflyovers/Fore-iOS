//
//  StatesCollectionView.h
//  Fore
//
//  Created by pavan krishna on 28/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FOStateCollectionViewCell.h"

@protocol StatesCollectionViewDataSource <NSObject>

@end

@protocol StatesCollectionViewDelegate <NSObject>

- (void)showCoursesForCorrespondingState:(NSInteger)stateID;

@end

@interface StatesCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) NSMutableArray *cellStatesArray;

@property (nonatomic, assign) id<StatesCollectionViewDataSource> collectionViewDataSource;
@property (nonatomic, assign) id<StatesCollectionViewDelegate> collectionViewDelegate;

@end
