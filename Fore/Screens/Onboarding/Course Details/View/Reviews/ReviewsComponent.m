//
//  ReviewsComponent.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "ReviewsComponent.h"
#import "ReviewsTableViewCell.h"

@interface ReviewsComponent()

@property (nonatomic, strong) LayoutManager *layoutManager;
@property (nonatomic, strong) UITableView *reviewsTableView;

@end

@implementation ReviewsComponent

-(void)viewDidLoad;
{
    [super viewDidLoad];
    self.layoutManager = [[LayoutManager alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubviews];
    [self updateConstraints];

    [[self reviewsTableView] registerClass:[ReviewsTableViewCell class] forCellReuseIdentifier:@"reviewsTableViewCellIdentifier"];
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        self.layoutManager = [[LayoutManager alloc] init];
//        self.backgroundColor = [UIColor whiteColor];
//        [self addSubviews];
//        
//        [[self reviewsTableView] registerClass:[ReviewsTableViewCell class] forCellReuseIdentifier:@"reviewsTableViewCellIdentifier"];
    }
    return self;
}

-(void)addSubviews;
{
    [[self view] addSubview:[self reviewsTableView]];
}

-(void)updateConstraints;
{
    [[self reviewsTableView] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.height.equalTo(@([self.layoutManager height:75]));
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
    
//    [super updateConstraints];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReviewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reviewsTableViewCellIdentifier" forIndexPath:indexPath];
    [self configureCellTitle:cell withIndexPath:indexPath];
    
    return cell;
}

-(UITableViewCell *)configureCellTitle:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath;
{
    ReviewsTableViewCell *reviewsTableViewCell = (ReviewsTableViewCell *)cell;
    [reviewsTableViewCell setProfileImage:@"course_dummy_image"];
    [reviewsTableViewCell setUserNameInfo:@"User name"];
    [reviewsTableViewCell setDateInfo:@"Apr 2016"];
    [reviewsTableViewCell setReviewInfo:@"Review..."];
    
    return reviewsTableViewCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return [[self layoutManager] height:14.5];
}

#pragma mark - Lazy Loading

-(UITableView *)reviewsTableView;
{
    if (_reviewsTableView) {
        return _reviewsTableView;
    }
    
    _reviewsTableView = [UITableView new];
    //    [[_reviewsTableView layer] setBorderColor:[UIColor brownColor].CGColor];
    //    [[_reviewsTableView layer] setBorderWidth:1];
    [_reviewsTableView setDataSource:self];
    [_reviewsTableView setDelegate:self];
    [_reviewsTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [_reviewsTableView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [_reviewsTableView setBackgroundColor:[UIColor clearColor]];
    
    return _reviewsTableView;
}

@end

