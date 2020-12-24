//
//  ImageManager.m
//  Thummit
//
//  Created by 이성준 on 2020/12/14.
//

#import "ImageManager.h"
@implementation ImageManager

+ (ImageManager *)sharedInstance {
    static ImageManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ImageManager alloc] init];
    });
    
    return sharedInstance;
}


@end
