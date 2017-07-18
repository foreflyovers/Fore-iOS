//
//  HeaderVideoView.m
//  Fore
//
//  Created by pavan krishna on 05/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "HeaderVideoView.h"
#import "GUIPlayerView.h"

@interface HeaderVideoView ()<GUIPlayerViewDelegate>

@property (strong, nonatomic) GUIPlayerView *videoPlayerView;
@property (strong, nonatomic) UIView *playerView;
@property (strong, nonatomic) UIImageView *playerIcon;

@property (nonatomic, strong) UILabel *courseNameLabel;
@property (nonatomic, strong) UILabel *courseTownLabel;
@property (nonatomic, strong) UILabel *courseStateLabel;

@property (nonatomic, strong) UIButton *golfStatsButton;

@property (nonatomic, assign) BOOL isPlaying;
@property (nonatomic, assign) BOOL userRequestedPause;

@end

@implementation HeaderVideoView

-(instancetype)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
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
    [self.playerView addSubview:[self courseTownLabel]];
    [self.playerView addSubview:[self courseStateLabel]];
    [self.playerView addSubview:[self courseNameLabel]];
    [self.playerView addSubview:[self golfStatsButton]];
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
    
    CGFloat screenWidth = [self frame].size.width;
    CGFloat screenHeight = [self frame].size.height;
    
    [[self playerView] setFrame:CGRectMake(0,
                                           0,
                                           (screenWidth * 100)/100,
                                           (screenHeight * 100)/100)];
    
    [[self playerIcon] setFrame:CGRectMake(CGRectGetMidX(self.frame)-(screenWidth * 7.5)/100,
                                           CGRectGetMidY(self.frame)-(screenHeight * 17)/100,
                                           (screenWidth * 15)/100,
                                           (screenHeight * 30)/100)];
    
    [[self courseTownLabel] setFrame:CGRectMake((screenWidth * 3)/100,
                                           CGRectGetMaxY(self.frame)-(screenHeight * 10)/100,
                                           (screenWidth * 15)/100,
                                           (screenHeight * 10)/100)];
    
    [[self courseStateLabel] setFrame:CGRectMake(CGRectGetMaxX(self.courseTownLabel.frame)+(screenWidth * 1)/100,
                                                CGRectGetMaxY(self.frame)-(screenHeight * 10)/100,
                                                (screenWidth * 15)/100,
                                                (screenHeight * 10)/100)];

    [[self courseNameLabel] setFrame:CGRectMake((screenWidth * 3)/100,
                                                CGRectGetMinY(self.courseTownLabel.frame)-(screenHeight * 15)/100,
                                                (screenWidth * 35)/100,
                                                (screenHeight * 15)/100)];

    [[self golfStatsButton] setFrame:CGRectMake(CGRectGetMaxX([self frame])-(screenWidth * 15)/100,
                                                CGRectGetMaxY([self frame])-(screenHeight * 18)/100,
                                                (screenWidth * 12)/100,
                                                (screenHeight * 15)/100)];

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

-(UILabel*)newLabel;
{
    UILabel *label = [UILabel new];
//        [[label layer] setBorderColor:[UIColor redColor].CGColor];
//        [[label layer] setBorderWidth:1];
    [label setTextColor:[UIColor darkGrayColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    return label;
}

-(UILabel *)courseNameLabel;
{
    if (_courseNameLabel) {
        return _courseNameLabel;
    }
    
    _courseNameLabel = [self newLabel];
    if IS_IPHONE_5
    {
        [_courseNameLabel setFont:[UIFont boldSystemFontOfSize:14]];
    }
    else if (IS_IPHONE_6P)
    {
        [_courseNameLabel setFont:[UIFont boldSystemFontOfSize:18]];
    }
    else if (IS_IPHONE_6)
    {
        [_courseNameLabel setFont:[UIFont boldSystemFontOfSize:16]];
    }
    else if (IS_IPHONE_4_OR_LESS)
    {
        [_courseNameLabel setFont:[UIFont systemFontOfSize:12]];
    }
    [_courseNameLabel setTextColor:[UIColor whiteColor]];
    [_courseNameLabel setText:@"Course Name"];
    return _courseNameLabel;
}
-(UILabel *)courseTownLabel;
{
    if (_courseTownLabel) {
        return _courseTownLabel;
    }
    
    _courseTownLabel = [self newLabel];
    if IS_IPHONE_5
    {
        [_courseTownLabel setFont:[UIFont systemFontOfSize:10]];
    }
    else if (IS_IPHONE_6P)
    {
        [_courseTownLabel setFont:[UIFont systemFontOfSize:14]];
    }
    else if (IS_IPHONE_6)
    {
        [_courseTownLabel setFont:[UIFont systemFontOfSize:12]];
    }
    else if (IS_IPHONE_4_OR_LESS)
    {
        [_courseTownLabel setFont:[UIFont systemFontOfSize:8]];
    }
    [_courseTownLabel setTextColor:[UIColor whiteColor]];
    [_courseTownLabel setText:@"Town"];
    return _courseTownLabel;
}

-(UILabel *)courseStateLabel;
{
    if (_courseStateLabel) {
        return _courseStateLabel;
    }
    
    _courseStateLabel = [self newLabel];
    if IS_IPHONE_5
    {
        [_courseStateLabel setFont:[UIFont systemFontOfSize:10]];
    }
    else if (IS_IPHONE_6P)
    {
        [_courseStateLabel setFont:[UIFont systemFontOfSize:14]];
    }
    else if (IS_IPHONE_6)
    {
        [_courseStateLabel setFont:[UIFont systemFontOfSize:12]];
    }
    else if (IS_IPHONE_4_OR_LESS)
    {
        [_courseStateLabel setFont:[UIFont systemFontOfSize:8]];
    }
    [_courseStateLabel setTextColor:[UIColor whiteColor]];
    [_courseStateLabel setText:@"State"];
    return _courseStateLabel;
}

-(UIButton *)golfStatsButton;
{
    if (_golfStatsButton) {
        return _golfStatsButton;
    }
    
    _golfStatsButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [[_golfStatsButton layer] setBorderColor:[UIColor redColor].CGColor];
//        [[_golfStatsButton layer] setBorderWidth:1];
    [_golfStatsButton setImage:[UIImage imageNamed:@"golf_image"] forState:UIControlStateNormal];
    [_golfStatsButton addTarget:self action:@selector(golfStatsButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    return _golfStatsButton;
}


#pragma mark - GUI Player View Delegate Methods

- (void)playerWillEnterFullscreen {
    //    [[self navigationController] setNavigationBarHidden:YES];
    //    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
}

- (void)playerWillLeaveFullscreen {
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

-(void)golfStatsButtonPressed:(id)sender;
{
    
}


@end
