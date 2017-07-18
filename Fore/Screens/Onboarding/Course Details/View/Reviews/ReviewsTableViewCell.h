//
//  ReviewsTableViewCell.h
//  Fore
//
//  Created by pavan krishna on 03/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewsTableViewCell : UITableViewCell

-(void)setProfileImage:(NSString *)imagePath;
-(void)setUserNameInfo:(NSString *)userName;
-(void)setDateInfo:(NSString *)dateInfo;
-(void)setReviewInfo:(NSString *)reviewInfo;

@end
