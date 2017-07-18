//
//  ExploreViewController.m
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "ExploreViewController.h"
#import "FOStateCollectionViewCell.h"
#import "FOCourseCollectionViewCell.h"
#import "ExploreView.h"
#import "SSSearchBar.h"
#import "FOWeatherAPIService.h"
#import "SOLWeatherData.h"
#import "FOCoursesTableViewController.h"

@interface ExploreViewController ()<SSSearchBarDelegate,UIScrollViewDelegate,ExploreViewDataSource,ExploreViewDelegate>

@property (nonatomic, strong) LayoutManager *layoutManager;
@property (nonatomic, strong) UIButton *profileIconBtn;
@property (nonatomic, strong) SSSearchBar *searchbar;
@property (nonatomic, strong) NSMutableArray *statesArray;
@property (nonatomic, strong) ExploreView *exploreView;

@property (nonatomic, strong) SOLWeatherData *weatherModelData;

@end

@implementation ExploreViewController

-(void)loadView
{
    [super loadView];
    self.layoutManager = [[LayoutManager alloc] init];
    self.exploreView = [[ExploreView alloc] init];
    self.exploreView.dataSource = self;
    self.exploreView.delegate = self;
    self.view = self.exploreView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)createSearchBar;
{
    self.searchbar = [[SSSearchBar alloc] initWithFrame:CGRectMake(0, 0, [[self layoutManager] width:100], 32)];
    self.searchbar.cancelButtonHidden = YES;
    self.searchbar.placeholder = @"Search...";
    self.searchbar.delegate = self;
    
    self.navigationItem.titleView = self.searchbar;
}

-(void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];

    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBarHidden = NO;
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];

    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];

    [self createSearchBar];

    self.profileIconBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [self.profileIconBtn setImage:[UIImage imageNamed:@"profile_icon"] forState:UIControlStateNormal];
    [self.profileIconBtn addTarget:self action:@selector(profileIconButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.profileIconBtn setFrame:CGRectMake(44, 0, 32, 32)];
    
    UIView *rightBarButtonItems = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 76, 32)];
    [rightBarButtonItems addSubview:self.profileIconBtn];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarButtonItems];
    [self getWeatherData];
}

-(void)getWeatherData;
{
    __weak typeof(self) weakSelf = self;
    
    [[FOWeatherAPIService sharedInstance] getWeatherInfo:nil withCompletion:^(NSError *error, id results) {
        
        
        if (results != nil) {
            NSLog(@"results:%@",results);
            weakSelf.weatherModelData = results;
            NSLog(@"self.weatherModelData:%@",weakSelf.weatherModelData);
        }
        else
        {
            
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Actions

-(void)profileIconButtonPressed;
{
    [self performSegueWithIdentifier:@"gotoProfileScreen" sender:nil];
}

#pragma mark - SSSearchbar Delegate

-(void)searchBarSearchButtonClicked:(SSSearchBar *)searchBar;
{
    [self.searchbar endEditing:YES];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
    [self.searchbar endEditing:YES];
}

- (void)searchBarTextDidBeginEditing:(SSSearchBar *)searchBar
{
    self.navigationItem.leftBarButtonItems = nil;
}

- (void)searchBarTextDidEndEditing:(SSSearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(SSSearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

-(void)gotoCoursesScreen:(NSInteger)userID;
{
    [self performSegueWithIdentifier:@"gotoCoursesScreen" sender:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
{
    
    NSLog(@"self.weatherModelData:%@",self.weatherModelData);
    
    if ([[segue identifier] isEqualToString:@"gotoCoursesScreen"]) {
        FOCoursesTableViewController *controller = segue.destinationViewController;
        controller.weatherModelData = self.weatherModelData;
    }
}

@end
