//
//  OverviewVideoComponent.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "OverviewVideoComponent.h"
#import "GUIPlayerView.h"

@interface OverviewVideoComponent ()<GUIPlayerViewDelegate>

@property (strong, nonatomic) GUIPlayerView *videoPlayerView;
@property (strong, nonatomic) UIView *playerView;
@property (strong, nonatomic) UIImageView *playerIcon;

@property (nonatomic, assign) BOOL isPlaying;
@property (nonatomic, assign) BOOL userRequestedPause;

@end

@implementation OverviewVideoComponent

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        self.isPlaying = NO;
        self.userRequestedPause = NO;
        [self addViews];
        [self addGestures];
    }
    return self;
}

-(void)addGestures;
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:[self videoPlayerView] action:@selector(didTap)];
    [tapGesture setNumberOfTapsRequired:1];
    [self addGestureRecognizer:tapGesture];
}

-(void)prepareForReuse;
{
    [self setIsPlaying:NO];
    [self setUserRequestedPause:NO];
}

-(void)addViews;
{
    [self addSubview:[self playerView]];
    [self.playerView addSubview:[self playerIcon]];
}

-(void)didTap;
{
    self.userRequestedPause = !self.userRequestedPause;
    if (self.isPlaying) {
        [self pause];
    }else{
        [self play];
    }
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    
    CGFloat screenWidth = [[self contentView] frame].size.width;
    CGFloat screenHeight = [[self contentView] frame].size.height;

    [[self playerView] setFrame:CGRectMake((screenWidth * 4)/100,
                                                0,
                                                (screenWidth * 92)/100,
                                                (screenHeight * 100)/100)];

    [[self playerIcon] setFrame:CGRectMake(CGRectGetMidX(self.contentView.frame)-(screenWidth * 11.5)/100,
                                           CGRectGetMidY(self.contentView.frame)-(screenHeight * 17)/100,
                                           (screenWidth * 15)/100,
                                           (screenHeight * 30)/100)];
}

-(void)setVideoURL:(NSURL *)videoURL
{
    NSURL *URL = [NSURL URLWithString:@"http://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4"];
    [self.videoPlayerView setVideoURL:URL];
    [self.videoPlayerView prepareAndPlayAutomatically:YES];

}

-(void)play;
{
    NSURL *URL = [NSURL URLWithString:@"http://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4"];
    [self.videoPlayerView setVideoURL:URL];
    [self.videoPlayerView prepareAndPlayAutomatically:YES];
}

-(void)pause;
{
    [[self videoPlayerView] pause];
}

#pragma mark - Lazy Loading

-(GUIPlayerView *)videoPlayerView;
{
    if (_videoPlayerView) {
        return _videoPlayerView;
    }
    
    _videoPlayerView = [[GUIPlayerView alloc] init];
    [_videoPlayerView setDelegate:self];
    
    return _videoPlayerView;
}

-(UIView *)playerView;
{
    if (_playerView) {
        return _playerView;
    }
    
    _playerView = [UIView new];
    [_playerView setBackgroundColor:[UIColor blackColor]];
//    [self addSubview:_playerView];
//    [self bringSubviewToFront:_playerView];
    
    return _playerView;
}

-(UIImageView *)playerIcon;
{
    if (_playerIcon) {
        return _playerIcon;
    }
    
    _playerIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Circled Play Filled-50"]];
    _playerIcon.userInteractionEnabled = YES;
//    _playerIcon.layer.borderColor = [UIColor redColor].CGColor;
//    _playerIcon.layer.borderWidth = 1;
    return _playerIcon;
}
#pragma mark - GUI Player View Delegate Methods

- (void)playerWillEnterFullscreen {
    [[self delegate] playerWillEnterFullscreen];
//    [[self navigationController] setNavigationBarHidden:YES];
//    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
}

- (void)playerWillLeaveFullscreen {
    [[self delegate] playerWillLeaveFullscreen];
//    [[self navigationController] setNavigationBarHidden:NO];
//    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
}

- (void)playerDidEndPlaying {
    
    [self.videoPlayerView clean];
}

- (void)playerFailedToPlayToEnd {
    NSLog(@"Error: could not play video");
    [self.videoPlayerView clean];
}

@end
