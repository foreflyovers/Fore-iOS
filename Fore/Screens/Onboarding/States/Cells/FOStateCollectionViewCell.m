//
//  FOStateCollectionViewCell.m
//  Fore
//
//  Created by pavan krishna on 28/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOStateCollectionViewCell.h"
#import "LayoutManager.h"

@interface FOStateCollectionViewCell()

@property (nonatomic, strong) LayoutManager *layoutManager;

@end

@implementation FOStateCollectionViewCell

-(id)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
//        [[self layer] setBorderColor:[UIColor whiteColor].CGColor];
//        [[self layer] setBorderWidth:1];
        [self setBackgroundColor:[UIColor whiteColor]];
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
    [self addSubview:[self stateImageView]];
    [self addSubview:[self stateLabel]];
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    [[self stateImageView] setFrame:CGRectMake(0, 0, CGRectGetWidth([self frame]), CGRectGetHeight([self frame]))];
    [[self stateLabel] setFrame:CGRectMake(0, [[self layoutManager] height:25], CGRectGetWidth([self frame]), [self.layoutManager height:3.0])];

//    [[self courseLabel] setFrame:CGRectMake(0, 0,
//                                               CGRectGetWidth([[self contentView] frame]),
//                                               CGRectGetHeight([[self contentView] frame])-20)];
//                                               
//    [[self stateLabel] setFrame:CGRectMake(0, CGRectGetMaxY([[self stateImageView] frame]), CGRectGetWidth([[self contentView] frame]), 20)];
}

#pragma mark - LazyLoading

-(UIImageView *)stateImageView;
{
    if (_stateImageView) {
        return _stateImageView;
    }
    
    _stateImageView = [[UIImageView alloc] init];
    [_stateImageView setBackgroundColor:[UIColor whiteColor]];
//    [[_stateImageView layer] setBorderColor:[UIColor whiteColor].CGColor];
//    [[_stateImageView layer] setBorderWidth:1];
    
    return _stateImageView;
}

-(UILabel *)stateLabel;
{
    if (_stateLabel) {
        return _stateLabel;
    }
    
    _stateLabel = [UILabel new];
    [_stateLabel setBackgroundColor:[UIColor whiteColor]];
//    [[_stateLabel layer] setBorderColor:[UIColor whiteColor].CGColor];
//    [[_stateLabel layer] setBorderWidth:1];
    [_stateLabel setTextAlignment:NSTextAlignmentLeft];
    [_stateLabel setFont:[UIFont systemFontOfSize:12]];
    [_stateLabel setTextColor:[UIColor darkGrayColor]];
    [_stateLabel setText:@""];
    
    return _stateLabel;
}

@end
