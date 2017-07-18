//
//  CoursesCollectionView.m
//  Fore
//
//  Created by pavan krishna on 28/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "CoursesCollectionView.h"
#import "Masonry.h"
#import "LayoutManager.h"

@interface CoursesCollectionView()

@property (nonatomic, strong) LayoutManager *layoutManager;
@property (nonatomic, strong) UICollectionView *statesCollectionView;

@end

@implementation CoursesCollectionView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (instancetype)init;
{
    self.layoutManager = [[LayoutManager alloc] init];
    //
    //    CGRect bounds = CGRectMake(0, 0, [self.layoutManager width:100], [self.layoutManager height:40]);
    //
    //    CGFloat widthOfCell = CGRectGetWidth(bounds);
    //    CGFloat itemSize = widthOfCell / 3;
    self.cellCoursesArray = [NSMutableArray array];
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    [dict1 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict1 setObject:@"Florida" forKey:@"name"];
    [dict1 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict1];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    [dict2 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict2 setObject:@"Georgia" forKey:@"name"];
    [dict2 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict2];
    
    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
    [dict3 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict3 setObject:@"Ohio" forKey:@"name"];
    [dict3 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict3];
    
    NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
    [dict4 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict4 setObject:@"New York" forKey:@"name"];
    [dict4 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict4];
    
    NSMutableDictionary *dict5 = [NSMutableDictionary dictionary];
    [dict5 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict5 setObject:@"Illinois" forKey:@"name"];
    [dict5 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict5];
    
    NSMutableDictionary *dict6 = [NSMutableDictionary dictionary];
    [dict6 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict6 setObject:@"New Jersey" forKey:@"name"];
    [dict6 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict6];
    
    NSMutableDictionary *dict7= [NSMutableDictionary dictionary];
    [dict7 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict7 setObject:@"Florida" forKey:@"name"];
    [dict7 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict7];
    
    NSMutableDictionary *dict8 = [NSMutableDictionary dictionary];
    [dict8 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict8 setObject:@"Georgia" forKey:@"name"];
    [dict8 setObject:@"Miami" forKey:@"town"];

    [_cellCoursesArray addObject:dict8];
    
    NSMutableDictionary *dict9 = [NSMutableDictionary dictionary];
    [dict9 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict9 setObject:@"Ohio" forKey:@"name"];
    [dict9 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict9];
    
    NSMutableDictionary *dict10 = [NSMutableDictionary dictionary];
    [dict10 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict10 setObject:@"New York" forKey:@"name"];
    [dict10 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict10];
    
    NSMutableDictionary *dict11 = [NSMutableDictionary dictionary];
    [dict11 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict11 setObject:@"Illinois" forKey:@"name"];
    [dict11 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict11];
    
    NSMutableDictionary *dict12 = [NSMutableDictionary dictionary];
    [dict12 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict12 setObject:@"New Jersey" forKey:@"name"];
    [dict12 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict12];
    
    NSMutableDictionary *dict13 = [NSMutableDictionary dictionary];
    [dict13 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict13 setObject:@"Florida" forKey:@"name"];
    [dict13 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict13];
    
    NSMutableDictionary *dict14 = [NSMutableDictionary dictionary];
    [dict14 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict14 setObject:@"Georgia" forKey:@"name"];
    [dict14 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict14];
    
    NSMutableDictionary *dict15 = [NSMutableDictionary dictionary];
    [dict15 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict15 setObject:@"Ohio" forKey:@"name"];
    [dict15 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict15];
    
    NSMutableDictionary *dict16 = [NSMutableDictionary dictionary];
    [dict16 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict16 setObject:@"New York" forKey:@"name"];
    [dict16 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict16];
    
    NSMutableDictionary *dict17 = [NSMutableDictionary dictionary];
    [dict17 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict17 setObject:@"Illinois" forKey:@"name"];
    [dict17 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict17];
    
    NSMutableDictionary *dict18 = [NSMutableDictionary dictionary];
    [dict18 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict18 setObject:@"New Jersey" forKey:@"name"];
    [dict18 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict18];
    
    NSMutableDictionary *dict19 = [NSMutableDictionary dictionary];
    [dict19 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict19 setObject:@"Florida" forKey:@"name"];
    [dict19 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict19];
    
    NSMutableDictionary *dict20 = [NSMutableDictionary dictionary];
    [dict20 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict20 setObject:@"Georgia" forKey:@"name"];
    [dict20 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict20];
    
    NSMutableDictionary *dict21 = [NSMutableDictionary dictionary];
    [dict21 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict21 setObject:@"Ohio" forKey:@"name"];
    [dict21 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict21];
    
    NSMutableDictionary *dict22 = [NSMutableDictionary dictionary];
    [dict22 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict22 setObject:@"New York" forKey:@"name"];
    [dict22 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict22];
    
    NSMutableDictionary *dict23 = [NSMutableDictionary dictionary];
    [dict23 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict23 setObject:@"Illinois" forKey:@"name"];
    [dict23 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict23];
    
    NSMutableDictionary *dict24 = [NSMutableDictionary dictionary];
    [dict24 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
    [dict24 setObject:@"New Jersey" forKey:@"name"];
    [dict24 setObject:@"Miami" forKey:@"town"];
    [_cellCoursesArray addObject:dict24];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    [layout setItemSize:CGSizeMake([self.layoutManager width:45], [self.layoutManager height:30])];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    self = [self initWithFrame:CGRectZero collectionViewLayout:layout];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout;
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self setDataSource:self];
        [self setDelegate:self];
    }
    return self;
}

#pragma mark - UICollectionView DataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@" states count:%lu",(unsigned long)[[self cellCoursesArray] count]);
    return [[self cellCoursesArray] count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"courseCellIdentifier";
    
    FOCourseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSString *cellimagePath = [[_cellCoursesArray objectAtIndex:indexPath.row] objectForKey:@"cellImage"];
    NSString *title = [[_cellCoursesArray objectAtIndex:indexPath.row] objectForKey:@"name"];
    NSLog(@"image path:%@",cellimagePath);
    NSLog(@"title: %@",title);
    cell.courseImageView.image = [UIImage imageNamed:cellimagePath];
    cell.courseLabel.text = title;
    cell.townLabel.text = [[_cellCoursesArray objectAtIndex:indexPath.row] objectForKey:@"town"];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([self.layoutManager width:45], [self.layoutManager height:30]);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
{
    CGSize headerSize = CGSizeZero;
    return headerSize;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGSize footerSize = CGSizeZero;
    return footerSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
{
    UIEdgeInsets edgeinsets = UIEdgeInsetsZero;
    edgeinsets = UIEdgeInsetsMake(-[[self layoutManager] height:8], [[self layoutManager] width:5], [[self layoutManager] height:0], [[self layoutManager] width:5]);
    return edgeinsets;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
{
    return [[self layoutManager] width:3];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
{
    return 0.0;
}

#pragma mark - UICollectionView Delegate Methods

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    [[self coursesCollectionViewDelegate] gotoCoursesScreen:1];
}

#pragma mark - UICollectionViewCell Delegate Methods

-(void)userTappedStateButton;
{
    
}

@end
