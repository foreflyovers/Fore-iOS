//
//  ReviewsTableViewCell.m
//  Fore
//
//  Created by pavan krishna on 03/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "ReviewsTableViewCell.h"

@interface ReviewsTableViewCell()

@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *reviewLabel;

@end

@implementation ReviewsTableViewCell

#pragma mark - life cycle

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //        [self setBackgroundColor:[UIColor yellowColor]];
        [self addViews];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    if ( !(self = [super initWithCoder:aDecoder]) ) return nil;
    
    // Your code goes here!
    [self addViews];
    return self;
}

-(void)prepareForReuse;
{
    [super prepareForReuse];
    
}

#pragma mark view building

-(void)addViews;
{
    [[self contentView] addSubview:[self profileImageView]];
    [[self contentView] addSubview:[self usernameLabel]];
    [[self contentView] addSubview:[self dateLabel]];
    [[self contentView] addSubview:[self reviewLabel]];
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenHeight = [[self contentView] frame].size.height;

    [[self profileImageView] setFrame:CGRectMake((screenWidth * 6.25)/100,
                                              (screenHeight * 23.5)/100,
                                              (screenWidth * 12.5)/100,
                                              (screenHeight * 47)/100)];
    
    [[self usernameLabel] setFrame:CGRectMake(CGRectGetMaxX([[self profileImageView] frame])+20,
                                               CGRectGetMinY([[self profileImageView] frame]),
                                               70,
                                               20)];
    [[self usernameLabel] sizeToFit];
    [[self dateLabel] setFrame:CGRectMake(CGRectGetMaxX([[self profileImageView] frame])+20,
                                             CGRectGetMaxY([[self usernameLabel] frame])+10,
                                             50,
                                             20)];
    [[self dateLabel] sizeToFit];
    [[self reviewLabel] setFrame:CGRectMake(20,
                                              CGRectGetMaxY([[self profileImageView] frame])+10,
                                            CGRectGetWidth([[self contentView] frame])-40,
                                              40)];
    [[self reviewLabel] sizeToFit];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark - Public methods

-(void)setProfileImage:(NSString *)imagePath;
{
    [[self profileImageView] setImage:[UIImage imageNamed:imagePath]];
}

-(void)setUserNameInfo:(NSString *)userName;
{
    [[self usernameLabel] setText:userName];
}

-(void)setDateInfo:(NSString *)dateInfo;
{
    [[self dateLabel] setText:dateInfo];
}

-(void)setReviewInfo:(NSString *)reviewInfo;
{
    [[self reviewLabel] setText:reviewInfo];
}

#pragma mark - Lazy loading

-(UIImageView *)profileImageView;
{
    if (_profileImageView) {
        return _profileImageView;
    }
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;

    _profileImageView = [UIImageView new];
    [_profileImageView setImage:[UIImage imageNamed:@"course_dummy_image"]];
//    [[_profileImageView layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_profileImageView layer] setBorderWidth:1];
    [[_profileImageView layer] setMasksToBounds:YES];
    [[_profileImageView layer] setCornerRadius:((screenWidth * 12.5)/100)/2];
    
    return _profileImageView;
}

-(UILabel*)newLabel;
{
    UILabel *label = [UILabel new];
//        [[label layer] setBorderColor:[UIColor redColor].CGColor];
//        [[label layer] setBorderWidth:1];
    [label setFont:[UIFont systemFontOfSize:13]];
    [label setTextColor:[UIColor lightGrayColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    return label;
}

-(UILabel *)usernameLabel;
{
    if (_usernameLabel) {
        return _usernameLabel;
    }
    
    _usernameLabel = [self newLabel];
    return _usernameLabel;
}

-(UILabel *)dateLabel;
{
    if (_dateLabel) {
        return _dateLabel;
    }
    
    _dateLabel = [self newLabel];
    
    return _dateLabel;
}

-(UILabel *)reviewLabel;
{
    if (_reviewLabel) {
        return _reviewLabel;
    }
    
    _reviewLabel = [self newLabel];
    [_reviewLabel setTextAlignment:NSTextAlignmentLeft];

    return _reviewLabel;
}
@end
