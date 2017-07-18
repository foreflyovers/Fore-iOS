//
//  FOCourseDetailsView.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOCourseDetailsView.h"
#import "Masonry.h"
#import "LayoutManager.h"
#import "TLYShyNavBarManager.h"

@interface FOCourseDetailsView()
{
    BOOL isOverviewSelected;
    BOOL isHolebyHoleSelected;
    BOOL isReviewsSelected;
}
@property (nonatomic, strong) LayoutManager *layoutManager;

@end
@implementation FOCourseDetailsView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.layoutManager = [[LayoutManager alloc] init];
        self.backgroundColor = [UIColor whiteColor];
        isOverviewSelected = YES;
        [self addSubviews];
    }
    return self;
}

-(void)addSubviews;
{
//    [self addSubview:[self headerVideoOverlayComponent]];
//    [self addSubview:[self segmentedControl]];
//    [self addSubview:[self overViewComponent]];
//    [self addSubview:[self holeByHoleComponent]];
//    [self addSubview:[self reviewsComponent]];
}

-(void)updateConstraints;
{
//    [[self headerVideoOverlayComponent] mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset([self.layoutManager height:0]);
//        make.height.equalTo(@([self.layoutManager height:40]));
//        make.left.equalTo(self).offset([self.layoutManager width:7]);
//        make.right.equalTo(self).offset(-[self.layoutManager width:7]);
//    }];
////
////    [[self segmentedControl] mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.equalTo(self.headerVideoOverlayComponent.mas_bottom).offset([self.layoutManager height:1]);
////        make.height.equalTo(@([self.layoutManager height:5]));
////        make.left.equalTo(self).offset([self.layoutManager width:7]);
////        make.right.equalTo(self).offset(-[self.layoutManager width:7]);
////    }];
////    
////    [[self overViewComponent] mas_remakeConstraints:^(MASConstraintMaker *make) {
////        if (isOverviewSelected == YES) {
////            make.top.equalTo(self.segmentedControl.mas_bottom).offset([self.layoutManager height:1]);
////            make.height.equalTo(@([self.layoutManager height:79]));
////            make.left.equalTo(self).offset([self.layoutManager width:2]);
////            make.right.equalTo(self).offset(-[self.layoutManager width:2]);
////        }
////        else
////        {
////            make.top.equalTo(self.segmentedControl.mas_bottom).offset([self.layoutManager height:1]);
////            make.left.equalTo(self).offset([self.layoutManager width:2]);
////            make.width.equalTo(@([self.layoutManager width:0]));
////            make.height.equalTo(@([self.layoutManager height:0]));
////        }
////    }];
////    
////    [[self holeByHoleComponent] mas_remakeConstraints:^(MASConstraintMaker *make) {
////        if (isHolebyHoleSelected == YES) {
////            make.top.equalTo(self.segmentedControl.mas_bottom).offset([self.layoutManager height:1]);
////            make.height.equalTo(@([self.layoutManager height:79]));
////            make.left.equalTo(self).offset([self.layoutManager width:2]);
////            make.right.equalTo(self).offset(-[self.layoutManager width:2]);
////        }
////        else
////        {
////            make.top.equalTo(self.segmentedControl.mas_bottom).offset([self.layoutManager height:1]);
////            make.left.equalTo(self).offset([self.layoutManager width:2]);
////            make.width.equalTo(@([self.layoutManager width:0]));
////            make.height.equalTo(@([self.layoutManager height:0]));
////        }
////    }];
////    
////    [[self reviewsComponent] mas_remakeConstraints:^(MASConstraintMaker *make) {
////        if (isReviewsSelected == YES) {
////            make.top.equalTo(self.segmentedControl.mas_bottom).offset([self.layoutManager height:1]);
////            make.height.equalTo(@([self.layoutManager height:79]));
////            make.left.equalTo(self).offset([self.layoutManager width:2]);
////            make.right.equalTo(self).offset(-[self.layoutManager width:2]);
////        }
////        else
////        {
////            make.top.equalTo(self.segmentedControl.mas_bottom).offset([self.layoutManager height:1]);
////            make.left.equalTo(self).offset([self.layoutManager width:2]);
////            make.width.equalTo(@([self.layoutManager width:0]));
////            make.height.equalTo(@([self.layoutManager height:0]));
////        }
////    }];
//
    [super updateConstraints];
}

//-(HeaderVideoOverlayComponent *)headerVideoOverlayComponent;
//{
//    if (_headerVideoOverlayComponent) {
//        return _headerVideoOverlayComponent;
//    }
//    
//    _headerVideoOverlayComponent = [HeaderVideoOverlayComponent new];
//    [[_headerVideoOverlayComponent layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_headerVideoOverlayComponent layer] setBorderWidth:1];
//    return _headerVideoOverlayComponent;
//}
//
//-(UISegmentedControl *)segmentedControl;
//{
//    if (_segmentedControl) {
//        return _segmentedControl;
//    }
//    
//    NSArray *titles = [[NSArray alloc] initWithObjects:@"OverView",@"Hole-by-hole",@"Reviews", nil];
//
//    _segmentedControl = [[UISegmentedControl alloc] initWithItems:titles];
//    
//    [_segmentedControl setFrame:CGRectZero];
//    [_segmentedControl setSelectedSegmentIndex:0];
//    [_segmentedControl addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
//    
//    return _segmentedControl;
//}
//
//-(OverViewComponent *)overViewComponent;
//{
//    if (_overViewComponent) {
//        return _overViewComponent;
//    }
//    
//    _overViewComponent = [OverViewComponent new];
////    [[_overViewComponent layer] setBorderColor:[UIColor redColor].CGColor];
////    [[_overViewComponent layer] setBorderWidth:1];
//    return _overViewComponent;
//}
//
//-(HoleByHoleComponent *)holeByHoleComponent;
//{
//    if (_holeByHoleComponent) {
//        return _holeByHoleComponent;
//    }
//    
//    _holeByHoleComponent = [HoleByHoleComponent new];
//    //    [[_holeByHoleComponent layer] setBorderColor:[UIColor redColor].CGColor];
//    //    [[_holeByHoleComponent layer] setBorderWidth:1];
//    return _holeByHoleComponent;
//}
//
//-(ReviewsComponent *)reviewsComponent;
//{
//    if (_reviewsComponent) {
//        return _reviewsComponent;
//    }
//    
//    _reviewsComponent = [ReviewsComponent new];
//    //    [[_reviewsComponent layer] setBorderColor:[UIColor redColor].CGColor];
//    //    [[_reviewsComponent layer] setBorderWidth:1];
//    return _reviewsComponent;
//}

- (void)segmentChanged:(UISegmentedControl *)sender
{
    NSInteger selectedSegment = sender.selectedSegmentIndex;

    NSLog(@"Segment Changed:%ld",(long)selectedSegment);
    
    switch (selectedSegment) {
        case 0:
            isOverviewSelected = YES;
            isHolebyHoleSelected = NO;
            isReviewsSelected = NO;
            break;
        case 1:
            isOverviewSelected = NO;
            isHolebyHoleSelected = YES;
            isReviewsSelected = NO;
            break;
        case 2:
            isOverviewSelected = NO;
            isHolebyHoleSelected = NO;
            isReviewsSelected = YES;
            break;
        default:
            break;
    }
    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
    // update constraints now so we can animate the change
    [self updateConstraintsIfNeeded];

}

- (void)updateWeatherViewWithData:(SOLWeatherData *)data;
{
//    [[self overViewComponent] updateWeatherViewWithData:data];
}
@end
