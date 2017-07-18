//
//  HoleByHoleComponent.m
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "HoleByHoleComponent.h"
#import "HoleByHoleTableViewCell.h"
@interface HoleByHoleComponent()

@property (nonatomic, strong) LayoutManager *layoutManager;
@property (nonatomic, strong) UITableView *holeByHoleTableView;

@end

@implementation HoleByHoleComponent

-(void)viewDidLoad;
{
    [super viewDidLoad];
    self.layoutManager = [[LayoutManager alloc] init];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self addSubviews];
    [self updateConstraints];
    [[self holeByHoleTableView] registerClass:[HoleByHoleTableViewCell class] forCellReuseIdentifier:@"holeByHoleTableViewCellIdentifier"];

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        self.layoutManager = [[LayoutManager alloc] init];
//        self.backgroundColor = [UIColor whiteColor];
//        [self addSubviews];
//        
//        [[self holeByHoleTableView] registerClass:[HoleByHoleTableViewCell class] forCellReuseIdentifier:@"holeByHoleTableViewCellIdentifier"];
    }
    return self;
}

-(void)addSubviews;
{
    [[self view] addSubview:[self holeByHoleTableView]];
}

-(void)updateConstraints;
{
    [[self holeByHoleTableView] mas_makeConstraints:^(MASConstraintMaker *make) {
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
    HoleByHoleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"holeByHoleTableViewCellIdentifier" forIndexPath:indexPath];
    [self configureCellTitle:cell withIndexPath:indexPath];
    
    return cell;
}

-(UITableViewCell *)configureCellTitle:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath;
{
    HoleByHoleTableViewCell *holeByHoleTableViewCell = (HoleByHoleTableViewCell *)cell;
    [holeByHoleTableViewCell setHoleImage:@"course_dummy_image"];
    [holeByHoleTableViewCell setHoleInfo:@"Hole 12"];
    [holeByHoleTableViewCell setParInfo:@"Par 5"];
    [holeByHoleTableViewCell setYardsInfo:@"345 yards"];
    [holeByHoleTableViewCell setHandicapInfo:@"Handicap 6"];
    
    return holeByHoleTableViewCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return [[self layoutManager] height:14.5];
}

#pragma mark - Lazy Loading

-(UITableView *)holeByHoleTableView;
{
    if (_holeByHoleTableView) {
        return _holeByHoleTableView;
    }
    
    _holeByHoleTableView = [UITableView new];
//        [[_holeByHoleTableView layer] setBorderColor:[UIColor brownColor].CGColor];
//        [[_holeByHoleTableView layer] setBorderWidth:1];
    [_holeByHoleTableView setDataSource:self];
    [_holeByHoleTableView setDelegate:self];
    [_holeByHoleTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [_holeByHoleTableView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [_holeByHoleTableView setBackgroundColor:[UIColor clearColor]];
    
    return _holeByHoleTableView;
}

@end
