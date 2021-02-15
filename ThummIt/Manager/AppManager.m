//
//  AppManager.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/15.
//

#import "AppManager.h"

@implementation AppManager

+ (AppManager *)sharedInstance {
    static AppManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppManager alloc] init];
    });
    
    return sharedInstance;
}

@end
