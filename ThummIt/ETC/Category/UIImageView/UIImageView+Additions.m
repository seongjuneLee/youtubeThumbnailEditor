//
//  UIImageView+Additions.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/24.
//

#import "UIImageView+Additions.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImageView (Additions)


- (UIColor *) colorOfPoint:(CGPoint)point
{
    unsigned char pixel[4] = {0};

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();

    CGContextRef context = CGBitmapContextCreate(pixel, 1, 1, 8, 4, colorSpace, kCGBitmapAlphaInfoMask & kCGImageAlphaPremultipliedLast);

    CGContextTranslateCTM(context, -point.x, -point.y);

    [self.layer renderInContext:context];

    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);

    UIColor *color;
    color = [UIColor colorWithRed:pixel[0]/255.0f green:pixel[1]/255.0f blue:pixel[2]/255.0f alpha:1.0];

    if (pixel[0] == 0 && pixel[1] ==0 && pixel[2] ==0) {
        color = UIColor.blackColor;
    }
    if (pixel[0] == pixel[1] && pixel[1] == pixel[2] && pixel[1] <= 255.0f && pixel[1]!=0 ){
        color = UIColor.whiteColor;
    }

    return color;
}

@end
