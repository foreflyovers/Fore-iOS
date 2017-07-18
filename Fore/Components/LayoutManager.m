//
//  LayoutManager.m
//  NumberLine
//
//  Created by pavan krishna on 02/04/16.
//  Copyright © 2016 NumberLine. All rights reserved.
//

#import "LayoutManager.h"

@implementation LayoutManager

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

//-(CGRect *)screenBounds;
//{
//    return [[UIScreen mainScreen] bounds];
//}

-(double)width:(CGFloat)widthPercentage;
{
    return ([[UIScreen mainScreen] bounds].size.width * widthPercentage)/100;
}

-(double)height:(CGFloat)heightPercentage;
{
    return [[UIScreen mainScreen] bounds].size.height * heightPercentage/100;
}

-(double)width:(CGFloat)widthPercentage andBaseView:(UIView *)baseView;
{
    return baseView.frame.size.width * widthPercentage/100;
}

-(double)height:(CGFloat)heightPercentage andBaseView:(UIView *)baseView;
{
    return baseView.frame.size.height * heightPercentage/100;
}

//
//- (BOOL)allowsHeaderViewsToFloat;
//{
//    return NO;
//}

//static func screenBounds() -> CGRect {
//    return UIScreen.mainScreen().bounds
//}
//
//static func width(widthPercentage:CGFloat) -> CGFloat {
//    return self.screenBounds().size.width * widthPercentage/100
//}
//
//static func height(heightPercentage:CGFloat) -> CGFloat {
//    return self.screenBounds().size.height * heightPercentage/100
//}
//
//static func width(widthPercentage:CGFloat, baseView:UIView) -> CGFloat {
//    return baseView.frame.size.width * widthPercentage/100
//}
//
//static func height(heightPercentage:CGFloat, baseView:UIView) -> CGFloat {
//    return baseView.frame.size.height * heightPercentage/100
//}



@end
