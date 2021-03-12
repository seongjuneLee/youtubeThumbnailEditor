//
//  UIImage+Additions.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/22.
//

#import "UIImage+Additions.h"

@implementation UIImage (Additions)

- (id) copyWithZone: (NSZone *) zone
{
    return [[UIImage allocWithZone: zone] initWithCGImage: self.CGImage];
}

+ (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}

+ (UIImage *)imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];

    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    
    return img;
}

- (UIImage *)crop:(CGRect)rect {
    if (self.scale > 1.0f) {
        rect = CGRectMake(rect.origin.x * self.scale,
                          rect.origin.y * self.scale,
                          rect.size.width * self.scale,
                          rect.size.height * self.scale);
    }

    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *result = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return result;
}

///crops image by trimming transparent edges
+ (UIImage *)trimImage:(UIImage *)originalImage {

    // components of replacement color – in a 255 UInt8 format (fairly standard bitmap format)
    const CGFloat* colorComponents = CGColorGetComponents([UIColor colorWithRed:1 green:0 blue:0 alpha:1].CGColor);
    UInt8* color255Components = calloc(sizeof(UInt8), 4);
    for (int i = 0; i < 4; i++) color255Components[i] = (UInt8)round(colorComponents[i]*255.0);

    // raw image reference
    CGImageRef rawImage = originalImage.CGImage;

    // image attributes
    size_t width = CGImageGetWidth(rawImage);
    size_t height = CGImageGetHeight(rawImage);
    CGRect rect = {CGPointZero, {width, height}};

    // image format
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = width*4;

    // the bitmap info
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big;

    // data pointer – stores an array of the pixel components. For example (r0, b0, g0, a0, r1, g1, b1, a1 .... rn, gn, bn, an)
    UInt8* data = calloc(bytesPerRow, height);

    // get new RGB color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();

    // create bitmap context
    CGContextRef ctx = CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);

    // draw image into context (populating the data array while doing so)
    CGContextDrawImage(ctx, rect, rawImage);

    //float iln2 = 1.0f/log(2.0f);

    float topTrim = 0;
    float bottomTrim = 0;
    float leftTrim = 0;
    float rightTrim = 0;

    @autoreleasepool {

        int pixelPosition = 0;

        //

        float row = 1;
        float column = 1;
        BOOL found = NO;
        while (row < height) {
            while (column < width) {
                pixelPosition = row*width+column;
                NSInteger pixelIndex = 4*pixelPosition;
                float alphaValue = data[pixelIndex+3]/255.0f;
                if (alphaValue > 0.01f) {
                    found = YES;
                    break;
                }
                column++;
            }
            if (found) {
                break;
            }
            column = 1;
            row++;
        }
        topTrim = row;

        //

        row = height-1;
        column = 1;
        found = NO;
        while (row > 0) {
            while (column < width) {
                pixelPosition = row*width+column;
                NSInteger pixelIndex = 4*pixelPosition;
                float alphaValue = data[pixelIndex+3]/255.0f;
                if (alphaValue > 0.01f) {
                    found = YES;
                    break;
                }
                column++;
            }
            if (found) {
                break;
            }
            column = 1;
            row--;
        }
        bottomTrim = row;

        //

        row = 1;
        column = 1;
        found = NO;
        while (column < width) {
            while (row < height) {
                pixelPosition = row*width+column;
                NSInteger pixelIndex = 4*pixelPosition;
                float alphaValue = data[pixelIndex+3]/255.0f;
                if (alphaValue > 0.01f) {
                    found = YES;
                    break;
                }
                row++;
            }
            if (found) {
                break;
            }
            row = 1;
            column++;
        }
        leftTrim = column;

        //

        row = 1;
        column = width-1;
        found = NO;
        while (column > 0) {
            while (row < height) {
                pixelPosition = row*width+column;
                NSInteger pixelIndex = 4*pixelPosition;
                float alphaValue = data[pixelIndex+3]/255.0f;
                if (alphaValue > 0.01f) {
                    found = YES;
                    break;
                }
                row++;
            }
            if (found) {
                break;
            }
            row = 1;
            column--;
        }
        rightTrim = column;

    }

    // clean up
    free(color255Components);
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(data);

    //

    float trimWidth = rightTrim-leftTrim;
    float trimHeight = bottomTrim-topTrim;

    UIView *trimCanvas = [[UIView alloc] initWithFrame:CGRectMake(0, 0, trimWidth, trimHeight)];
    trimCanvas.backgroundColor = [UIColor clearColor];

    UIImageView *trimImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    trimImageView.image = originalImage;
    trimImageView.contentMode = UIViewContentModeScaleToFill;
    trimImageView.backgroundColor = [UIColor clearColor];

    [trimCanvas addSubview:trimImageView];

    //

    trimImageView.center = CGPointMake(trimImageView.center.x-leftTrim, trimImageView.center.y-topTrim);

    //

    CGRect __rect = [trimCanvas bounds];
    UIGraphicsBeginImageContextWithOptions(__rect.size, (NO), (originalImage.scale));
    CGContextRef __context = UIGraphicsGetCurrentContext();
    [trimCanvas.layer renderInContext:__context];
    UIImage *__image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    //

    return __image;

}

@end
