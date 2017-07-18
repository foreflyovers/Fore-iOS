//
//  CourseInfoComponent.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "CourseInfoComponent.h"

@interface CourseInfoComponent ()

@property (nonatomic, strong) UILabel *infoTitleLabel;
@property (nonatomic, strong) UILabel *infoContentLabel;

@end

@implementation CourseInfoComponent

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
    [[self contentView] addSubview:[self infoTitleLabel]];
    [[self contentView] addSubview:[self infoContentLabel]];
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    
    CGFloat spacing = CGRectGetWidth([[self contentView] frame])/9;
    
    [[self infoTitleLabel] setFrame:CGRectMake(spacing, CGRectGetHeight([[self contentView] frame])/5, CGRectGetWidth([[self contentView] frame])-(spacing*2), CGRectGetHeight([[self contentView] frame])/4)];
    
    [[self infoContentLabel] setFrame:CGRectMake(spacing, CGRectGetMaxY([[self infoTitleLabel] frame]), CGRectGetWidth([[self contentView] frame])-(spacing*2), CGRectGetHeight([[self contentView] frame])/2)];
}

-(UILabel *)infoTitleLabel;
{
    if (_infoTitleLabel) {
        return _infoTitleLabel;
    }
    
    _infoTitleLabel = [UILabel new];
//    [[_infoTitleLabel layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_infoTitleLabel layer] setBorderWidth:1];
    [_infoTitleLabel setTextColor:[UIColor grayColor]];
    [_infoTitleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [_infoTitleLabel setText:@"About this course"];

    return _infoTitleLabel;
}

-(UILabel *)infoContentLabel;
{
    if (_infoContentLabel) {
        return _infoContentLabel;
    }
    
    _infoContentLabel = [UILabel new];
//    [[_infoContentLabel layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_infoContentLabel layer] setBorderWidth:1];
    [_infoContentLabel setTextColor:[UIColor grayColor]];
    [_infoContentLabel setFont:[UIFont systemFontOfSize:14]];
    
    return _infoContentLabel;
}

-(void)setInfoContent:(NSString *)content
{
    [[self infoContentLabel] setText:content];
}

@end

