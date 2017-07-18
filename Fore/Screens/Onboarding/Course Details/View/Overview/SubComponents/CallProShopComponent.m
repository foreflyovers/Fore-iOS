//
//  CallProShopComponent.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "CallProShopComponent.h"

@interface CallProShopComponent ()

@property (nonatomic, strong) UILabel *callTitleLabel;
@property (nonatomic, strong) UIButton *callButton;

@end

@implementation CallProShopComponent

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
    [[self contentView] addSubview:[self callTitleLabel]];
    [[self contentView] addSubview:[self callButton]];
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    
    [[self callTitleLabel] setFrame:CGRectMake(10, CGRectGetMidY([[self contentView] frame])-15, CGRectGetWidth([[self contentView] frame])/2, 30)];
    [[self callButton] setFrame:CGRectMake(CGRectGetMaxX([[self contentView] frame])-30-10, CGRectGetMidY([[self contentView] frame])-20, 40, 40)];
}

-(UILabel *)callTitleLabel;
{
    if (_callTitleLabel) {
        return _callTitleLabel;
    }
    
    _callTitleLabel = [UILabel new];
//    [[_callTitleLabel layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_callTitleLabel layer] setBorderWidth:1];
    [_callTitleLabel setTextColor:[UIColor grayColor]];
    [_callTitleLabel setFont:[UIFont systemFontOfSize:14]];
    
    return _callTitleLabel;
}

-(UIButton *)callButton;
{
    if (_callButton) {
        return _callButton;
    }
    
    _callButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [[_callButton layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_callButton layer] setBorderWidth:1];
    [_callButton setImage:[UIImage imageNamed:@"call_image"] forState:UIControlStateNormal];
    [_callButton addTarget:self action:@selector(callButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    return _callButton;
}

-(void)setCallText:(NSString *)cellText;
{
    [[self callTitleLabel] setText:cellText];
}

-(void)setCellImage:(NSString *)imageName;
{
    [[self callButton] setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

-(void)callButtonPressed:(id)sender;
{

}

@end
