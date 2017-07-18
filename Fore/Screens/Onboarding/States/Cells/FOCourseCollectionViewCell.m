//
//  FOCourseCollectionViewCell.m
//  Fore
//
//  Created by pavan krishna on 28/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOCourseCollectionViewCell.h"
#import "LayoutManager.h"

@interface FOCourseCollectionViewCell()

@property (nonatomic, strong) LayoutManager *layoutManager;

@end

@implementation FOCourseCollectionViewCell

-(id)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
//        [[self layer] setBorderColor:[UIColor orangeColor].CGColor];
//        [[self layer] setBorderWidth:1];
        self.layoutManager = [[LayoutManager alloc] init];
        [self addSubviews];
    }
    return self;
}

-(void)setNeedsDisplay;
{
    [super setNeedsDisplay];
}

-(void)addSubviews;
{
    [self addSubview:[self courseImageView]];
    [self addSubview:[self courseLabel]];
    [self addSubview:[self townLabel]];
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    [[self courseImageView] setFrame:CGRectMake(0, 0, CGRectGetWidth([self frame]), CGRectGetHeight([self frame])-[self.layoutManager height:3.9])];
    [[self courseLabel] setFrame:CGRectMake(0, CGRectGetMaxY([self courseImageView].frame), CGRectGetWidth([self frame]), [self.layoutManager height:3.0])];
    [[self townLabel] setFrame:CGRectMake(0, CGRectGetMaxY([self courseLabel].frame), CGRectGetWidth([self frame]), [self.layoutManager height:3.0])];
}

#pragma mark - LazyLoading

-(UIImageView *)courseImageView;
{
    if (_courseImageView) {
        return _courseImageView;
    }
    
    _courseImageView = [[UIImageView alloc] init];
//        [[_courseImageView layer] setBorderColor:[UIColor orangeColor].CGColor];
//        [[_courseImageView layer] setBorderWidth:1];
    
    return _courseImageView;
}

-(UILabel *)courseLabel;
{
    if (_courseLabel) {
        return _courseLabel;
    }
    
    _courseLabel = [UILabel new];
    [_courseLabel setBackgroundColor:[UIColor whiteColor]];
//        [[_courseLabel layer] setBorderColor:[UIColor redColor].CGColor];
//        [[_courseLabel layer] setBorderWidth:1];
    [_courseLabel setTextAlignment:NSTextAlignmentLeft];
    [_courseLabel setFont:[UIFont systemFontOfSize:12]];
    [_courseLabel setTextColor:[UIColor darkGrayColor]];
    [_courseLabel setText:@""];
    
    return _courseLabel;
}

-(UILabel *)townLabel;
{
    if (_townLabel) {
        return _townLabel;
    }
    
    _townLabel = [UILabel new];
    [_townLabel setBackgroundColor:[UIColor whiteColor]];
//        [[_townLabel layer] setBorderColor:[UIColor redColor].CGColor];
//        [[_townLabel layer] setBorderWidth:1];
    [_townLabel setTextAlignment:NSTextAlignmentLeft];
    [_townLabel setFont:[UIFont systemFontOfSize:12]];
    [_townLabel setTextColor:[UIColor lightGrayColor]];
    [_townLabel setText:@""];
    
    return _townLabel;
}

@end
