//
//  UIColor+Additions.m
//  Vlogr
//
//  Created by TaejunLee on 2019. 2. 17..
//  Copyright © 2019년 TaejunLee. All rights reserved.
//

#import "UIColor+Additions.h"
#import "UIColor+patternArchive.h"
#import <objc/runtime.h>

@implementation UIColor (Additions)

static char STRING_KEY; // global 0 initialization is fine here, no


-(UIColor*)setBrightness:(CGFloat)brightness alpha:(CGFloat)alpha {
    CGFloat hue = 0.0F;
    CGFloat saturation = 0.0F;
    
    [self getHue:&hue saturation:&saturation brightness:nil alpha:nil];
    
    // if the above fails then hue and saturation will still be 0.0F
    // according to Apple's documentation <1>
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}


+ (UIColor*) diagonalGradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height
{
    CGSize size = CGSizeMake(1, height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    NSArray* colors = [NSArray arrayWithObjects:(id)c1.CGColor, (id)c2.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (CFArrayRef)colors, NULL);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(size.height/2, size.height), 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIColor* color = [UIColor colorWithPatternImage:image];
    [color setAssociatedObject:image];
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return color;
}


@end
