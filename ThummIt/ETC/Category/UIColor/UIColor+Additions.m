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

+ (UIColor*)pixelColorInImage:(UIImage*)image atPoint:(CGPoint)point {

    int x = (int)point.x;
    int y = (int)point.y;
    
    if (x == (int)image.size.width*image.scale) {
        x = (int)image.size.width*image.scale - 1;
    }
    CFDataRef pixelData = CGDataProviderCopyData(CGImageGetDataProvider(image.CGImage));
    const UInt8* data = CFDataGetBytePtr(pixelData);

    int pixelInfo = ((image.size.width * y) + x ) * 4; // 4 bytes per pixel

    UInt8 red   = data[pixelInfo + 0];
    UInt8 green = data[pixelInfo + 1];
    UInt8 blue  = data[pixelInfo + 2];
    CFRelease(pixelData);
    
    UIColor *color = [UIColor colorWithRed:red  /255.0f
                                     green:green/255.0f
                                      blue:blue /255.0f
                                     alpha:1.0];
    
    if (x == 0) {
        color = UIColor.whiteColor;
    }


    return color;
}


@end
