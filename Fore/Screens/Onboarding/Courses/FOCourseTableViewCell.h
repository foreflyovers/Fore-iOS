//
//  FOCourseTableViewCell.h
//  Fore
//
//  Created by pavan krishna on 01/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FOCourseTableViewCell : UITableViewCell

-(void)setCourseImage:(NSString *)imagePath;
-(void)setCourseName:(NSString *)courseName;
-(void)setTownName:(NSString *)townName;
-(void)setParText:(NSString *)par;
-(void)setSlopeText:(NSString *)slope;

@end
