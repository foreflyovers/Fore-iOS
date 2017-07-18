//
//  FOCourseDetailsViewController.m
//  Fore
//
//  Created by pavan krishna on 28/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOCourseDetailsViewController.h"
#import "FOCourseDetailsView.h"
#import "LayoutManager.h"
#import "SOLWeatherData.h"
#import "TLYShyNavBarManager.h"

@interface FOCourseDetailsViewController ()<FOCourseDetailsViewDataSource,FOCourseDetailsViewDelegate>
{
    UIBarButtonItem *backButtonItem;
}
@property (nonatomic, strong) LayoutManager *layoutManager;

@property(nonatomic, strong) UIButton *starButton;
@property(nonatomic, strong) UIButton *shareButton;
@property(nonatomic, strong) UISearchBar *searchbar;
@property(nonatomic, strong) NSMutableArray *statesArray;
@property(nonatomic, strong) FOCourseDetailsView *courseDetailsView;

//  Formats weather data timestamps
@property (strong, nonatomic) NSDateFormatter       *dateFormatter;

@end

@implementation FOCourseDetailsViewController

-(void)loadView
{
    [super loadView];
    
    self.layoutManager = [[LayoutManager alloc] init];
    
    self.courseDetailsView = [[FOCourseDetailsView alloc] init];
    self.courseDetailsView.contentSize = CGSizeMake([self.layoutManager width:100], 2000);
    self.courseDetailsView.showsVerticalScrollIndicator = YES;
    self.courseDetailsView.dataSource = self;
    self.courseDetailsView.delegate = self;
    self.view = self.courseDetailsView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    UIView *rightBarButtonItems = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 76, 32)];
    [rightBarButtonItems addSubview:self.starButton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarButtonItems];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 20, 21)];
    UIImage *backImage = [UIImage imageNamed:@"Back_50"];
    [backButton setImage:backImage  forState:UIControlStateNormal];
    [backButton setTitle:@"" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:backButtonItem,nil];

//    [[FOWeatherAPIService sharedInstance] getWeatherInfo:nil withCompletion:^(NSError *error, id results) {
//        NSLog(@"results:%@",results);
//        [self updateWeatherViewWithData:results];
//    }];
}

-(void)viewWillAppear:(BOOL)animated;
{
//    UIView *navbar = self.navigationController.navigationBar;
//    
//    if (navbar) {
//        if ([[self shyNavBarManager] scrollView]==nil) {
//            [[self shyNavBarManager] setScrollView:[[self courseDetailsView] overViewComponent]];
//            
//            UIView *extensionView = [[self courseDetailsView] segmentedControl];
//            [[self shyNavBarManager] setExtensionView:extensionView];
//        }
//    }
}

- (void)updateWeatherViewWithData:(SOLWeatherData *)data
{
    if(!data) {
        return;
    }
    
    [[self courseDetailsView] updateWeatherViewWithData:data];
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

- (void)backButtonPressed;
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
