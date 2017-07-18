//
//  HoleByHoleTableViewCell.m
//  Fore
//
//  Created by pavan krishna on 03/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "HoleByHoleTableViewCell.h"
#import "LayoutManager.h"

@interface HoleByHoleTableViewCell()

@property (nonatomic, strong) LayoutManager *layoutManager;

@property (nonatomic, strong) UIImageView *holeImageView;
@property (nonatomic, strong) UILabel *holeInfoLabel;
@property (nonatomic, strong) UILabel *parInfoLabel;
@property (nonatomic, strong) UILabel *yardsInfoLabel;
@property (nonatomic, strong) UILabel *handicapInfoLabel;

@end

@implementation HoleByHoleTableViewCell

#pragma mark - life cycle

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.layoutManager = [[LayoutManager alloc] init];
//        NSLog(@"width:%f",[self.layoutManager width:23]);
//        NSLog(@"width:%f",[self.layoutManager width:23 andBaseView:[self contentView]]);

        [self addViews];
    }
    return self;
}

//-(id)initWithCoder:(NSCoder *)aDecoder {
//    if ( !(self = [super initWithCoder:aDecoder]) ) return nil;
//    
//    self.layoutManager = [[LayoutManager alloc] init];
//    NSLog(@"width:%f",[self.layoutManager width:23]);
//    NSLog(@"width:%f",[self.layoutManager width:23 andBaseView:[self contentView]]);
//
//    [self addViews];
//    return self;
//}

-(void)prepareForReuse;
{
    [super prepareForReuse];
}

#pragma mark view building

-(void)addViews;
{
    [[self contentView] addSubview:[self holeImageView]];
    [[self contentView] addSubview:[self handicapInfoLabel]];
    [[self contentView] addSubview:[self yardsInfoLabel]];
    [[self contentView] addSubview:[self parInfoLabel]];
    [[self contentView] addSubview:[self holeInfoLabel]];
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenHeight = [[self contentView] frame].size.height;
    
    [[self holeImageView] setFrame:CGRectMake((screenWidth * 6.25)/100,
                                                CGRectGetMidY([[self contentView] frame])-(screenHeight * 35.25)/100,
                                                (screenWidth * 18.75)/100,
                                                (screenHeight * 70.5)/100)];

    [[self handicapInfoLabel] setFrame:CGRectMake(CGRectGetMaxX([[self contentView] frame]) - (screenWidth * 20.25)/100,
                                                  CGRectGetMidY([[self contentView] frame])-(screenWidth * 3.125)/100,
                                                  (screenWidth * 25)/100,
                                                  (screenHeight * 28)/100)];
    [[self handicapInfoLabel] sizeToFit];
    
    [[self yardsInfoLabel] setFrame:CGRectMake(CGRectGetMinX([[self handicapInfoLabel] frame])-(screenWidth * 18)/100,
                                               CGRectGetMidY([[self contentView] frame])-(screenWidth * 3.125)/100,
                                               (screenWidth * 21.8)/100,
                                               (screenHeight * 28)/100)];
    [[self yardsInfoLabel] sizeToFit];
    
    [[self parInfoLabel] setFrame:CGRectMake(CGRectGetMinX([[self yardsInfoLabel] frame])-(screenWidth * 10)/100,
                                             CGRectGetMidY([[self contentView] frame])-(screenWidth * 3.125)/100,
                                             (screenWidth * 15.625)/100,
                                             (screenHeight * 28)/100)];
    [[self parInfoLabel] sizeToFit];
    
    [[self holeInfoLabel] setFrame:CGRectMake(CGRectGetMinX([[self parInfoLabel] frame])-((screenWidth * 13)/100),
                                              CGRectGetMidY([[self contentView] frame])-((screenWidth * 3.125)/100),
                                              (screenWidth * 15.625)/100,
                                                  (screenHeight * 28)/100)];
    [[self holeInfoLabel] sizeToFit];
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

-(void)setHoleImage:(NSString *)imagePath;
{
    [[self holeImageView] setImage:[UIImage imageNamed:imagePath]];
}

-(void)setHoleInfo:(NSString *)holeName;
{
    [[self holeInfoLabel] setText:holeName];
}

-(void)setParInfo:(NSString *)parInfo;
{
    [[self parInfoLabel] setText:parInfo];
}

-(void)setYardsInfo:(NSString *)yardsInfo;
{
    [[self yardsInfoLabel] setText:yardsInfo];
}

-(void)setHandicapInfo:(NSString *)handicapInfo;
{
    [[self handicapInfoLabel] setText:handicapInfo];
}

#pragma mark - Lazy loading

-(UIImageView *)holeImageView;
{
    if (_holeImageView) {
        return _holeImageView;
    }
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;

    _holeImageView = [UIImageView new];
    [_holeImageView setImage:[UIImage imageNamed:@"course_dummy_image"]];
//    [[_holeImageView layer] setBorderColor:[UIColor redColor].CGColor];
//    [[_holeImageView layer] setBorderWidth:1];
    [[_holeImageView layer] setMasksToBounds:YES];
    [[_holeImageView layer] setCornerRadius:((screenWidth * 18.75)/100)/2];
    
    return _holeImageView;
}

-(UILabel*)newLabel;
{
    UILabel *label = [UILabel new];
//    [[label layer] setBorderColor:[UIColor redColor].CGColor];
//    [[label layer] setBorderWidth:1];
    
    if IS_IPHONE_5
    {
        [label setFont:[UIFont systemFontOfSize:11]];
    }
    else if (IS_IPHONE_6P)
    {
        [label setFont:[UIFont systemFontOfSize:15]];
    }
    else if (IS_IPHONE_6)
    {
        [label setFont:[UIFont systemFontOfSize:13]];
    }    
    
    [label setTextColor:[UIColor lightGrayColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    return label;
}

-(UILabel *)holeInfoLabel;
{
    if (_holeInfoLabel) {
        return _holeInfoLabel;
    }
    
    _holeInfoLabel = [self newLabel];
    return _holeInfoLabel;
}

-(UILabel *)parInfoLabel;
{
    if (_parInfoLabel) {
        return _parInfoLabel;
    }
    
    _parInfoLabel = [self newLabel];

    return _parInfoLabel;
}

-(UILabel *)yardsInfoLabel;
{
    if (_yardsInfoLabel) {
        return _yardsInfoLabel;
    }
    
    _yardsInfoLabel = [self newLabel];

    return _yardsInfoLabel;
}

-(UILabel *)handicapInfoLabel;
{
    if (_handicapInfoLabel) {
        return _handicapInfoLabel;
    }
    
    _handicapInfoLabel = [self newLabel];

    return _handicapInfoLabel;
}

@end
