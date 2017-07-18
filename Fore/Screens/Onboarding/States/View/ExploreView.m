//
//  ExploreView.m
//  Fore
//
//  Created by pavan krishna on 28/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "ExploreView.h"
#import "Masonry.h"
#import "LayoutManager.h"

@interface ExploreView()

@property (nonatomic, strong) LayoutManager *layoutManager;

@end

@implementation ExploreView

#pragma mark - Set up

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.layoutManager = [[LayoutManager alloc] init];
        self.backgroundColor = [UIColor whiteColor];
        [self addSubviews];
    }
    return self;
}

-(void)addSubviews;
{
    [self addSubview:[self topLineView]];
    [self addSubview:[self featuredDestinationsTitle]];
    [self addSubview:[self statesCollectionView]];
    [self addSubview:[self lineView]];
    [self addSubview:[self coursesInStateTitle]];
    [self addSubview:[self coursesCollectionView]];
}

-(void)updateConstraints;
{
    [[self topLineView] mas_makeConstraints:^(MASConstraintMaker *make) {
        if (IS_IPHONE_4_OR_LESS)
        {
            make.top.equalTo(self.mas_top).offset([self.layoutManager height:13.5]);
            make.height.equalTo(@([self.layoutManager height:0.10]));
        }
        else
        {
            make.top.equalTo(self.mas_top).offset([self.layoutManager height:11]);
            make.height.equalTo(@([self.layoutManager height:0.05]));
        }
        make.left.equalTo(self).offset([self.layoutManager width:7]);
        make.right.equalTo(self).offset(-[self.layoutManager width:7]);
    }];

    [[self featuredDestinationsTitle] mas_makeConstraints:^(MASConstraintMaker *make) {
        if (IS_IPHONE_4_OR_LESS)
        {
            make.top.equalTo(self.topLineView.mas_bottom).offset([self.layoutManager height:0]);
        }
        else
        {
            make.top.equalTo(self.topLineView.mas_bottom).offset([self.layoutManager height:1]);
        }
        make.height.equalTo(@([self.layoutManager height:5]));
        make.left.equalTo(self).offset([self.layoutManager width:7]);
        make.right.equalTo(self).offset(-[self.layoutManager width:7]);
    }];

    [[self statesCollectionView] mas_makeConstraints:^(MASConstraintMaker *make) {
        if (IS_IPHONE_4_OR_LESS)
        {
            make.top.equalTo(self.featuredDestinationsTitle.mas_bottom).offset(-[self.layoutManager height:2]);
        }
        else
        {
            make.top.equalTo(self.featuredDestinationsTitle.mas_bottom).offset([self.layoutManager height:0]);
        }
        make.height.equalTo(@([self.layoutManager height:35]));
        make.left.equalTo(self).offset([self.layoutManager width:2]);
        make.right.equalTo(self).offset(-[self.layoutManager width:2]);
    }];

    [[self lineView] mas_makeConstraints:^(MASConstraintMaker *make) {
        if (IS_IPHONE_4_OR_LESS)
        {
            make.top.equalTo(self.statesCollectionView.mas_bottom).offset(-[self.layoutManager height:2]);
        }
        else
        {
            make.top.equalTo(self.statesCollectionView.mas_bottom).offset([self.layoutManager height:0]);
        }

        make.height.equalTo(@([self.layoutManager height:0.05]));
        make.left.equalTo(self).offset([self.layoutManager width:5]);
        make.right.equalTo(self).offset(-[self.layoutManager width:5]);
    }];

    [[self coursesInStateTitle] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).offset([self.layoutManager height:1]);
        make.height.equalTo(@([self.layoutManager height:5]));
        make.left.equalTo(self).offset([self.layoutManager width:7]);
        make.right.equalTo(self).offset(-[self.layoutManager width:7]);
    }];
    
    [[self coursesCollectionView] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coursesInStateTitle.mas_bottom).offset([self.layoutManager height:0]);
        make.height.equalTo(@([self.layoutManager height:40]));
        make.left.equalTo(self).offset([self.layoutManager width:2]);
        make.right.equalTo(self).offset(-[self.layoutManager width:2]);
    }];
    [super updateConstraints];
}

#pragma mark - Lazy Loading

-(UILabel *)featuredDestinationsTitle;
{
    if (_featuredDestinationsTitle) {
        return _featuredDestinationsTitle;
    }
    
    _featuredDestinationsTitle = [UILabel new];
    [_featuredDestinationsTitle setFont:[UIFont systemFontOfSize:17]];
    [_featuredDestinationsTitle setTextColor:[UIColor darkGrayColor]];
    [_featuredDestinationsTitle setText:@"Featured Destinations"];
    
    return _featuredDestinationsTitle;
}

-(UIView*)topLineView;
{
    if (_topLineView) {
        return _topLineView;
    }
    
    _topLineView = [UIView new];
    [_topLineView setBackgroundColor:[UIColor lightGrayColor]];
//    [[_topLineView layer] setBorderColor:[UIColor blackColor].CGColor];
//    [[_topLineView layer] setBorderWidth:1];

    return _topLineView;
}

-(UIView*)lineView;
{
    if (_lineView) {
        return _lineView;
    }
    
    _lineView = [UIView new];
    [_lineView setBackgroundColor:[UIColor lightGrayColor]];
//    [[_lineView layer] setBorderColor:[UIColor blackColor].CGColor];
//    [[_lineView layer] setBorderWidth:1];

    return _lineView;
}

-(UILabel *)coursesInStateTitle;
{
    if (_coursesInStateTitle) {
        return _coursesInStateTitle;
    }
    
    _coursesInStateTitle = [UILabel new];
    [_coursesInStateTitle setFont:[UIFont systemFontOfSize:17]];
    [_coursesInStateTitle setTextColor:[UIColor darkGrayColor]];
    [_coursesInStateTitle setText:@"Courses in Florida"];
    
    return _coursesInStateTitle;
}

-(StatesCollectionView *)statesCollectionView;
{
    if (_statesCollectionView) {
        return _statesCollectionView;
    }

    _statesCollectionView = [StatesCollectionView new];
//    [[_statesCollectionView layer] setBorderColor:[UIColor blackColor].CGColor];
//    [[_statesCollectionView layer] setBorderWidth:1];
    [_statesCollectionView setCollectionViewDataSource:self];
    [_statesCollectionView setCollectionViewDelegate:self];
    [_statesCollectionView registerClass:[FOStateCollectionViewCell class] forCellWithReuseIdentifier:@"stateCellIdentifier"];
    [_statesCollectionView setBackgroundColor:[UIColor clearColor]];

    return _statesCollectionView;
}

-(CoursesCollectionView *)coursesCollectionView;
{
    if (_coursesCollectionView) {
        return _coursesCollectionView;
    }
    
    _coursesCollectionView = [CoursesCollectionView new];
//    [[_coursesCollectionView layer] setBorderColor:[UIColor brownColor].CGColor];
//    [[_coursesCollectionView layer] setBorderWidth:1];
    [_coursesCollectionView setCoursesCollectionViewDataSource:self];
    [_coursesCollectionView setCoursesCollectionViewDelegate:self];
    [_coursesCollectionView registerClass:[FOCourseCollectionViewCell class] forCellWithReuseIdentifier:@"courseCellIdentifier"];    
    [_coursesCollectionView setBackgroundColor:[UIColor clearColor]];
    
    return _coursesCollectionView;
}

#pragma mark - Delegate Methods

-(void)reloadStatesCollectionView;
{
    NSLog(@"playersArray:%@",self.statesArray);
    [[self statesCollectionView] reloadData];
}

-(void)showCoursesForCorrespondingState:(NSInteger)stateID;
{
    
}

-(void)gotoCoursesScreen:(NSInteger)userID;
{
    [[self delegate] gotoCoursesScreen:userID];
}
@end
