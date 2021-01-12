//
//  ColorManager.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/12.
//

#import "ColorManager.h"

@implementation ColorManager

+ (ColorManager *)sharedInstance {
    static ColorManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ColorManager alloc] init];
    });
    
    return sharedInstance;
}

-(NSArray *)bgColors{
    
    UIColor *clear = [UIColor clearColor];
    UIColor *black = [UIColor blackColor];
    UIColor *white = [UIColor whiteColor];
    UIColor *orange = [UIColor colorWithRed:245.0/255.0 green:188.8/255.0 blue:66.0/255.0 alpha:1.0];
    UIColor *pink = [UIColor colorWithRed:241/255.0 green:186/255.0 blue:189/255.0 alpha:1.0];
    UIColor *deepPink = [UIColor colorWithRed:212/255.0 green:74/255.0 blue:105/255.0 alpha:1.0];
    UIColor *lavender = [UIColor colorWithRed:215/255.0 green:209/255.0 blue:243/255.0 alpha:1.0];

    return @[clear,black,white,orange,pink,deepPink,lavender];
}

@end
