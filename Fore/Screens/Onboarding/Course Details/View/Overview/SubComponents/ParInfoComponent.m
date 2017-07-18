//
//  ParInfoComponent.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "ParInfoComponent.h"
#import <Masonry/Masonry.h>
#import "LayoutManager.h"

@interface ParInfoComponent ()
@property (nonatomic, strong) LayoutManager *layoutManager;

@property (nonatomic, strong) UILabel *parInfoTitleLabel;
@property (nonatomic, strong) UILabel *slopeInfoTitleLabel;
@property (nonatomic, strong) UILabel *ratingInfoTitleLabel;
@property (nonatomic, strong) UILabel *lengthInfoTitleLabel;

@property (nonatomic, strong) UILabel *parInfoValueLabel;
@property (nonatomic, strong) UILabel *slopeInfoValueLabel;
@property (nonatomic, strong) UILabel *ratingInfoValueLabel;
@property (nonatomic, strong) UILabel *lengthInfoValueLabel;

@end

@implementation ParInfoComponent

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubviews];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

-(void)prepareForReuse;
{
    [super prepareForReuse];
}

-(void)addSubviews;
{

    [[self contentView] addSubview:[self parInfoValueLabel]];
    [[self contentView] addSubview:[self slopeInfoValueLabel]];
    [[self contentView] addSubview:[self ratingInfoValueLabel]];
    [[self contentView] addSubview:[self lengthInfoValueLabel]];
    
    [[self contentView] addSubview:[self parInfoTitleLabel]];
    [[self contentView] addSubview:[self slopeInfoTitleLabel]];
    [[self contentView] addSubview:[self ratingInfoTitleLabel]];
    [[self contentView] addSubview:[self lengthInfoTitleLabel]];

}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    
    CGFloat spacing = CGRectGetWidth([[self contentView] frame])/5;
    
    [[self parInfoValueLabel] setFrame:CGRectMake(spacing/2, CGRectGetHeight([[self contentView] frame])/5, CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/2)];
    
    [[self slopeInfoValueLabel] setFrame:CGRectMake(CGRectGetMaxX([[self parInfoValueLabel] frame]), CGRectGetHeight([[self contentView] frame])/5, CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/2)];
    
    [[self ratingInfoValueLabel] setFrame:CGRectMake(CGRectGetMaxX([[self slopeInfoValueLabel] frame]),CGRectGetHeight([[self contentView] frame])/5, CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/2)];
    
    [[self lengthInfoValueLabel] setFrame:CGRectMake(CGRectGetMaxX([[self ratingInfoValueLabel] frame]), CGRectGetHeight([[self contentView] frame])/5, CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/2)];
    
    [[self parInfoTitleLabel] setFrame:CGRectMake(spacing/2, CGRectGetMaxY([[self parInfoValueLabel] frame]), CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/4)];
    
    [[self slopeInfoTitleLabel] setFrame:CGRectMake(CGRectGetMaxX([[self parInfoTitleLabel] frame]), CGRectGetMaxY([[self slopeInfoValueLabel] frame]), CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/4)];
    
    [[self ratingInfoTitleLabel] setFrame:CGRectMake(CGRectGetMaxX([[self slopeInfoTitleLabel] frame]),CGRectGetMaxY([[self ratingInfoValueLabel] frame]), CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/4)];
    
    [[self lengthInfoTitleLabel] setFrame:CGRectMake(CGRectGetMaxX([[self ratingInfoTitleLabel] frame]), CGRectGetMaxY([[self lengthInfoValueLabel] frame]), CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/4)];
}


#pragma mark - Lazy loading

-(UILabel *)parInfoTitleLabel;
{
    if (_parInfoTitleLabel) {
        return _parInfoTitleLabel;
    }
    
    _parInfoTitleLabel = [UILabel new];
//    [[_parInfoTitleLabel layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_parInfoTitleLabel layer] setBorderWidth:1];
    [_parInfoTitleLabel setTextAlignment:NSTextAlignmentCenter];
    [_parInfoTitleLabel setTextColor:[UIColor grayColor]];
    [_parInfoTitleLabel setFont:[UIFont systemFontOfSize:14]];
    [_parInfoTitleLabel setText:@"Par"];
    
    return _parInfoTitleLabel;
}

-(UILabel *)slopeInfoTitleLabel;
{
    if (_slopeInfoTitleLabel) {
        return _slopeInfoTitleLabel;
    }
    
    _slopeInfoTitleLabel = [UILabel new];
//    [[_slopeInfoTitleLabel layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_slopeInfoTitleLabel layer] setBorderWidth:1];
    [_slopeInfoTitleLabel setTextAlignment:NSTextAlignmentCenter];
    [_slopeInfoTitleLabel setTextColor:[UIColor grayColor]];
    [_slopeInfoTitleLabel setFont:[UIFont systemFontOfSize:14]];
    [_slopeInfoTitleLabel setText:@"Slope"];
    
    return _slopeInfoTitleLabel;
}

-(UILabel *)ratingInfoTitleLabel;
{
    if (_ratingInfoTitleLabel) {
        return _ratingInfoTitleLabel;
    }
    
    _ratingInfoTitleLabel = [UILabel new];
//    [[_ratingInfoTitleLabel layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_ratingInfoTitleLabel layer] setBorderWidth:1];
    [_ratingInfoTitleLabel setTextAlignment:NSTextAlignmentCenter];
    [_ratingInfoTitleLabel setTextColor:[UIColor grayColor]];
    [_ratingInfoTitleLabel setFont:[UIFont systemFontOfSize:14]];
    [_ratingInfoTitleLabel setText:@"Rating"];
    
    return _ratingInfoTitleLabel;
}

-(UILabel *)lengthInfoTitleLabel;
{
    if (_lengthInfoTitleLabel) {
        return _lengthInfoTitleLabel;
    }
    
    _lengthInfoTitleLabel = [UILabel new];
//    [[_lengthInfoTitleLabel layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_lengthInfoTitleLabel layer] setBorderWidth:1];
    [_lengthInfoTitleLabel setTextAlignment:NSTextAlignmentCenter];
    [_lengthInfoTitleLabel setTextColor:[UIColor grayColor]];
    [_lengthInfoTitleLabel setFont:[UIFont systemFontOfSize:14]];
    [_lengthInfoTitleLabel setText:@"Length"];
    
    return _lengthInfoTitleLabel;
}

-(UILabel *)parInfoValueLabel;
{
    if (_parInfoValueLabel) {
        return _parInfoValueLabel;
    }
    
    _parInfoValueLabel = [UILabel new];
//    [[_parInfoValueLabel layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_parInfoValueLabel layer] setBorderWidth:1];
    [_parInfoValueLabel setTextAlignment:NSTextAlignmentCenter];
    [_parInfoValueLabel setTextColor:[UIColor grayColor]];
    [_parInfoValueLabel setFont:[UIFont systemFontOfSize:18]];
    
    return _parInfoValueLabel;
}

-(UILabel *)slopeInfoValueLabel;
{
    if (_slopeInfoValueLabel) {
        return _slopeInfoValueLabel;
    }
    
    _slopeInfoValueLabel = [UILabel new];
//    [[_slopeInfoValueLabel layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_slopeInfoValueLabel layer] setBorderWidth:1];
    [_slopeInfoValueLabel setTextAlignment:NSTextAlignmentCenter];
    [_slopeInfoValueLabel setTextColor:[UIColor grayColor]];
    [_slopeInfoValueLabel setFont:[UIFont systemFontOfSize:18]];
    
    return _slopeInfoValueLabel;
}

-(UILabel *)ratingInfoValueLabel;
{
    if (_ratingInfoValueLabel) {
        return _ratingInfoValueLabel;
    }
    
    _ratingInfoValueLabel = [UILabel new];
//    [[_ratingInfoValueLabel layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_ratingInfoValueLabel layer] setBorderWidth:1];
    [_ratingInfoValueLabel setTextAlignment:NSTextAlignmentCenter];
    [_ratingInfoValueLabel setTextColor:[UIColor grayColor]];
    [_ratingInfoValueLabel setFont:[UIFont systemFontOfSize:18]];
    
    return _ratingInfoValueLabel;
}

-(UILabel *)lengthInfoValueLabel;
{
    if (_lengthInfoValueLabel) {
        return _lengthInfoValueLabel;
    }
    
    _lengthInfoValueLabel = [UILabel new];
//    [[_lengthInfoValueLabel layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_lengthInfoValueLabel layer] setBorderWidth:1];
    [_lengthInfoValueLabel setTextAlignment:NSTextAlignmentCenter];
    [_lengthInfoValueLabel setTextColor:[UIColor grayColor]];
    [_lengthInfoValueLabel setFont:[UIFont systemFontOfSize:18]];
    
    return _lengthInfoValueLabel;
}

-(void)setParInfo:(NSString *)parInfo;
{
    [[self parInfoValueLabel] setText:parInfo];
}

-(void)setSlopeInfo:(NSString *)slopeInfo;
{
    [[self slopeInfoValueLabel] setText:slopeInfo];
}

-(void)setRatingInfo:(NSString *)ratingInfo;
{
    [[self ratingInfoValueLabel] setText:ratingInfo];
}

-(void)setLengthInfo:(NSString *)lengthInfo;
{
    [[self lengthInfoValueLabel] setText:lengthInfo];
}
@end
