//
//  TypoManager.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/08.
//

#import "TypoManager.h"
#import "Typography.h"
#import "TypoHeader.h"
@implementation TypoManager

+ (TypoManager *)sharedInstance {
    static TypoManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TypoManager alloc] init];
    });
    
    return sharedInstance;
}

-(NSArray *)typos{
    
    NormalTypo *normal = [NormalTypo normalTypo];
    TrapezoidTypo *trapezoidTypo = [TrapezoidTypo trapezoidTypo];
    RunningManLogoTypo *runningManLogoTypo = [RunningManLogoTypo runningManLogoTypo];
    return @[normal, trapezoidTypo, runningManLogoTypo];
}

@end
