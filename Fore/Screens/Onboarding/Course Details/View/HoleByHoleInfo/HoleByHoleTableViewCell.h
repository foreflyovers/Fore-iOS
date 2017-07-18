//
//  HoleByHoleTableViewCell.h
//  Fore
//
//  Created by pavan krishna on 03/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HoleByHoleTableViewCell : UITableViewCell

-(void)setHoleImage:(NSString *)imagePath;
-(void)setHoleInfo:(NSString *)holeName;
-(void)setParInfo:(NSString *)parInfo;
-(void)setYardsInfo:(NSString *)yardsInfo;
-(void)setHandicapInfo:(NSString *)handicapInfo;

@end
