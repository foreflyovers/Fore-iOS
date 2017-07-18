//
//  OverviewVideoComponent.h
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OverviewVideoComponentDataSource <NSObject>

@end

@protocol OverviewVideoComponentDelegate <NSObject>

- (void)playerWillEnterFullscreen;
- (void)playerWillLeaveFullscreen;
- (void)playerDidEndPlaying;
- (void)playerFailedToPlayToEnd;

@end

@interface OverviewVideoComponent : UITableViewCell

@property (nonatomic, assign) id<OverviewVideoComponentDataSource> dataSource;
@property (nonatomic, assign) id<OverviewVideoComponentDelegate> delegate;

@property (nonatomic, strong) UIImageView *mediaIcon;
-(void)prepareForReuse;

-(void)setVideoURL:(NSURL *)videoURL;

//Video
-(void)play;
-(void)pause;

@end
