//
//  FOCourseTableViewCell.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOCourseTableViewCell.h"

@interface FOCourseTableViewCell()

@property (nonatomic, strong) UIImageView *courseImageView;
@property (nonatomic, strong) UILabel *nameOfCourseLabel;
@property (nonatomic, strong) UILabel *townLabel;
@property (nonatomic, strong) UILabel *parLabel;
@property (nonatomic, strong) UILabel *slopeLabel;
@property (nonatomic, strong) UIButton *starButton;

@end

@implementation FOCourseTableViewCell

#pragma mark - life cycle

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self setBackgroundColor:[UIColor yellowColor]];
//        [self addViews];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    if ( !(self = [super initWithCoder:aDecoder]) ) return nil;
    [self setBackgroundColor:[UIColor whiteColor]];

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
    [[self contentView] addSubview:[self courseImageView]];
    [[self contentView] addSubview:[self nameOfCourseLabel]];
    [[self contentView] addSubview:[self townLabel]];
    [[self contentView] addSubview:[self parLabel]];
    [[self contentView] addSubview:[self slopeLabel]];
    [[self contentView] addSubview:[self starButton]];
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenHeight = [[self contentView] frame].size.height;
    
    [[self courseImageView] setFrame:CGRectMake((screenWidth * 6.25)/100,
                                              (screenHeight * 5)/100,
                                              (screenWidth * 87.5)/100,
                                              (screenHeight * 80)/100)];
    
    [[self nameOfCourseLabel] setFrame:CGRectMake((screenWidth * 6.25)/100,
                                              CGRectGetMaxY([[self courseImageView] frame])+(screenHeight * 2)/100,
                                              CGRectGetWidth([self frame])/2,
                                              10)];
    [[self nameOfCourseLabel] sizeToFit];
    
    [[self townLabel] setFrame:CGRectMake((screenWidth * 6.25)/100,
                                                  CGRectGetMaxY([[self nameOfCourseLabel] frame]),
                                                  CGRectGetWidth([self frame])/2,
                                                  10)];
    [[self townLabel] sizeToFit];
    
    [[self slopeLabel] setFrame:CGRectMake(CGRectGetMaxX([[self courseImageView] frame])-(screenWidth/9),
                                           CGRectGetMaxY([[self courseImageView] frame])+(screenHeight * 2)/100,
                                           screenWidth/9,
                                           10)];
//    [[self slopeLabel] sizeToFit];

    [[self parLabel] setFrame:CGRectMake(CGRectGetMinX([[self slopeLabel] frame])-screenWidth/9,
                                         CGRectGetMaxY([[self courseImageView] frame])+(screenHeight * 2)/100,
                                         screenWidth/9,
                                         10)];
//    [[self parLabel] sizeToFit];
    
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

-(void)setCourseImage:(NSString *)imagePath;
{
    [[self courseImageView] setImage:[UIImage imageNamed:imagePath]];
}

-(void)setCourseName:(NSString *)courseName;
{
    [[self nameOfCourseLabel] setText:courseName];
}

-(void)setTownName:(NSString *)townName;
{
    [[self townLabel] setText:townName];
}

-(void)setParText:(NSString *)par;
{
    [[self parLabel] setText:par];
}

-(void)setSlopeText:(NSString *)slope;
{
    [[self slopeLabel] setText:slope];
}

#pragma mark - Lazy loading

-(UIImageView *)courseImageView;
{
    if (_courseImageView) {
        return _courseImageView;
    }
    
    _courseImageView = [UIImageView new];
//    [[_courseImageView layer] setBorderColor:[UIColor blackColor].CGColor];
//    [[_courseImageView layer] setBorderWidth:1];
    
    return _courseImageView;
}

-(UILabel*)newLabel;
{
    UILabel *label = [UILabel new];
//    [[label layer] setBorderColor:[UIColor redColor].CGColor];
//    [[label layer] setBorderWidth:1];
    [label setTextColor:[UIColor lightGrayColor]];
    
    return label;
}

-(UILabel *)nameOfCourseLabel;
{
    if (_nameOfCourseLabel) {
        return _nameOfCourseLabel;
    }
    
    _nameOfCourseLabel = [self newLabel];
    [_nameOfCourseLabel setTextAlignment:NSTextAlignmentLeft];
    if IS_IPHONE_5
    {
        [_nameOfCourseLabel setFont:[UIFont boldSystemFontOfSize:12]];
    }
    else if (IS_IPHONE_6P)
    {
        [_nameOfCourseLabel setFont:[UIFont boldSystemFontOfSize:17]];
    }
    else if (IS_IPHONE_6)
    {
        [_nameOfCourseLabel setFont:[UIFont boldSystemFontOfSize:15]];
    }
    else if (IS_IPHONE_4_OR_LESS)
    {
        [_nameOfCourseLabel setFont:[UIFont systemFontOfSize:10]];
    }
    return _nameOfCourseLabel;
}

-(UILabel *)townLabel;
{
    if (_townLabel) {
        return _townLabel;
    }
    
    _townLabel = [self newLabel];
    [_townLabel setTextAlignment:NSTextAlignmentLeft];
    if IS_IPHONE_5
    {
        [_townLabel setFont:[UIFont systemFontOfSize:10]];
    }
    else if (IS_IPHONE_6P)
    {
        [_townLabel setFont:[UIFont systemFontOfSize:14]];
    }
    else if (IS_IPHONE_6)
    {
        [_townLabel setFont:[UIFont systemFontOfSize:12]];
    }
    else if (IS_IPHONE_4_OR_LESS)
    {
        [_townLabel setFont:[UIFont systemFontOfSize:8]];
    }
    
    return _townLabel;
}

-(UILabel *)parLabel;
{
    if (_parLabel) {
        return _parLabel;
    }
    
    _parLabel = [self newLabel];
    [_parLabel setTextAlignment:NSTextAlignmentRight];
    if IS_IPHONE_5
    {
        [_parLabel setFont:[UIFont systemFontOfSize:8]];
    }
    else if (IS_IPHONE_6P)
    {
        [_parLabel setFont:[UIFont systemFontOfSize:12]];
    }
    else if (IS_IPHONE_6)
    {
        [_parLabel setFont:[UIFont systemFontOfSize:10]];
    }
    else if (IS_IPHONE_4_OR_LESS)
    {
        [_parLabel setFont:[UIFont systemFontOfSize:7]];
    }
    return _parLabel;
}

-(UILabel *)slopeLabel;
{
    if (_slopeLabel) {
        return _slopeLabel;
    }
    
    _slopeLabel = [self newLabel];
    [_slopeLabel setTextAlignment:NSTextAlignmentRight];
    if IS_IPHONE_5
    {
        [_slopeLabel setFont:[UIFont systemFontOfSize:8]];
    }
    else if (IS_IPHONE_6P)
    {
        [_slopeLabel setFont:[UIFont systemFontOfSize:12]];
    }
    else if (IS_IPHONE_6)
    {
        [_slopeLabel setFont:[UIFont systemFontOfSize:10]];
    }
    else if (IS_IPHONE_4_OR_LESS)
    {
        [_slopeLabel setFont:[UIFont systemFontOfSize:7]];
    }
    return _slopeLabel;
}

@end
