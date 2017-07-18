//
//  HeaderVideoView.h
//  Fore
//
//  Created by pavan krishna on 05/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderVideoView : UIView

@property (nonatomic, strong) UIImageView *mediaIcon;
-(void)prepareForReuse;

-(void)setVideoURL:(NSURL *)videoURL;

//Video
-(void)play;
-(void)pause;

@end
