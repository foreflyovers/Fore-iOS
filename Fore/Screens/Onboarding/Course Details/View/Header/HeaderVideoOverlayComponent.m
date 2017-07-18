//
//  HeaderVideoOverlayComponent.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "HeaderVideoOverlayComponent.h"
#import "HeaderVideoView.h"

@interface HeaderVideoOverlayComponent()

@property (nonatomic, strong) LayoutManager *layoutManager;
@property (strong, nonatomic) HeaderVideoView *headerVideoView;

@end
@implementation HeaderVideoOverlayComponent

-(void)viewDidLoad;
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    self.layoutManager = [[LayoutManager alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubviews];
    [self updateConstraints];
}

-(void)addSubviews;
{
    [self.view addSubview:[self headerVideoView]];
}

-(void)updateConstraints;
{
    [[self headerVideoView] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.height.equalTo(@([[self layoutManager] height:26.4]));
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
}

#pragma mark - Lazy Loading

-(HeaderVideoView *)headerVideoView;
{
    if (_headerVideoView) {
        return _headerVideoView;
    }
    
    _headerVideoView = [[HeaderVideoView alloc] initWithFrame:CGRectZero];
//    [[_headerVideoView layer] setBorderColor:[UIColor brownColor].CGColor];
//    [[_headerVideoView layer] setBorderWidth:1];
    [_headerVideoView setBackgroundColor:[UIColor clearColor]];
    
    return _headerVideoView;
}
@end
