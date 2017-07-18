//
//  LayoutManager.h
//  NumberLine
//
//  Created by pavan krishna on 02/04/16.
//  Copyright © 2016 NumberLine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LayoutManager : NSObject

-(double)width:(CGFloat)widthPercentage;
-(double)height:(CGFloat)heightPercentage;
-(double)width:(CGFloat)widthPercentage andBaseView:(UIView *)baseView;
-(double)height:(CGFloat)heightPercentage andBaseView:(UIView *)baseView;

@end
