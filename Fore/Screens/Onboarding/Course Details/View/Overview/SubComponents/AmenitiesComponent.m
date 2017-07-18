//
//  AmenitiesComponent.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "AmenitiesComponent.h"

@interface AmenitiesComponent ()

@property (nonatomic, strong) UIImageView *publicImageView;
@property (nonatomic, strong) UIImageView *clubImageView;
@property (nonatomic, strong) UIImageView *caddiesImageView;
@property (nonatomic, strong) UIImageView *cartsImageView;

@property (nonatomic, strong) UILabel *publicLabel;
@property (nonatomic, strong) UILabel *clubLabel;
@property (nonatomic, strong) UILabel *caddiesLabel;
@property (nonatomic, strong) UILabel *cartsLabel;

@end

@implementation AmenitiesComponent

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
    [[self contentView] addSubview:[self publicImageView]];
    [[self contentView] addSubview:[self clubImageView]];
    [[self contentView] addSubview:[self caddiesImageView]];
    [[self contentView] addSubview:[self cartsImageView]];
    
    [[self contentView] addSubview:[self publicLabel]];
    [[self contentView] addSubview:[self clubLabel]];
    [[self contentView] addSubview:[self caddiesLabel]];
    [[self contentView] addSubview:[self cartsLabel]];
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    
    CGFloat spacing = CGRectGetWidth([[self contentView] frame])/5;
    
    [[self publicImageView] setFrame:CGRectMake(spacing/2, CGRectGetHeight([[self contentView] frame])/7, CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/2)];
    
    [[self clubImageView] setFrame:CGRectMake(CGRectGetMaxX([[self publicImageView] frame]), CGRectGetHeight([[self contentView] frame])/7, CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/2)];
    
    [[self caddiesImageView] setFrame:CGRectMake(CGRectGetMaxX([[self clubImageView] frame]),CGRectGetHeight([[self contentView] frame])/7, CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/2)];
    
    [[self cartsImageView] setFrame:CGRectMake(CGRectGetMaxX([[self caddiesImageView] frame]), CGRectGetHeight([[self contentView] frame])/7, CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/2)];
    
    [[self publicLabel] setFrame:CGRectMake(spacing/2, CGRectGetMaxY([[self publicImageView] frame]), CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/4)];
    
    [[self clubLabel] setFrame:CGRectMake(CGRectGetMaxX([[self publicLabel] frame]), CGRectGetMaxY([[self clubImageView] frame]), CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/4)];
    
    [[self caddiesLabel] setFrame:CGRectMake(CGRectGetMaxX([[self clubLabel] frame]),CGRectGetMaxY([[self caddiesImageView] frame]), CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/4)];
    
    [[self cartsLabel] setFrame:CGRectMake(CGRectGetMaxX([[self caddiesLabel] frame]), CGRectGetMaxY([[self cartsImageView] frame]), CGRectGetWidth([[self contentView] frame])/5, CGRectGetHeight([[self contentView] frame])/4)];
}

#pragma mark - Lazy loading

-(UIImageView*)newImageView;
{
    UIImageView *imgView = [UIImageView new];
//    [[imgView layer] setBorderColor:[UIColor redColor].CGColor];
//    [[imgView layer] setBorderWidth:1];

    return imgView;
}

-(UILabel*)newLabel;
{
    UILabel *label = [UILabel new];
    [label setFont:[UIFont systemFontOfSize:10]];
    [label setTextColor:[UIColor blackColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    return label;
}

-(UIImageView *)publicImageView;
{
    if (_publicImageView) {
        return _publicImageView;
    }
    
    _publicImageView = [self newImageView];
    [_publicImageView setImage:[UIImage imageNamed:@"public_image"]];

    return _publicImageView;
}

-(UIImageView *)clubImageView;
{
    if (_clubImageView) {
        return _clubImageView;
    }
    
    _clubImageView = [self newImageView];
    [_clubImageView setImage:[UIImage imageNamed:@"club_image"]];

    return _clubImageView;
}


-(UIImageView *)caddiesImageView;
{
    if (_caddiesImageView) {
        return _caddiesImageView;
    }
    
    _caddiesImageView = [self newImageView];
    [_caddiesImageView setImage:[UIImage imageNamed:@"caddies_image"]];

    return _caddiesImageView;
}

-(UIImageView *)cartsImageView;
{
    if (_cartsImageView) {
        return _cartsImageView;
    }
    
    _cartsImageView = [self newImageView];
    [_cartsImageView setImage:[UIImage imageNamed:@"carts_image"]];

    return _cartsImageView;
}

-(UILabel *)publicLabel;
{
    if (_publicLabel) {
        return _publicLabel;
    }
    
    _publicLabel = [self newLabel];
    [_publicLabel setText:@"Public"];
    return _publicLabel;
}

-(UILabel *)clubLabel;
{
    if (_clubLabel) {
        return _clubLabel;
    }
    
    _clubLabel = [self newLabel];
    [_clubLabel setText:@"Clubhouse"];
    return _clubLabel;
}

-(UILabel *)caddiesLabel;
{
    if (_caddiesLabel) {
        return _caddiesLabel;
    }
    
    _caddiesLabel = [self newLabel];
    [_caddiesLabel setText:@"Caddies"];
    return _caddiesLabel;
}

-(UILabel *)cartsLabel;
{
    if (_cartsLabel) {
        return _cartsLabel;
    }
    
    _cartsLabel = [self newLabel];
    [_cartsLabel setText:@"Carts"];
    return _cartsLabel;
}

//-(void)setDummyName:(NSString *)townName;
//{
//    [[self dummyLabel] setText:townName];
//}

@end
