//
//  WorkManFiveFingerSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "WorkManFiveFingerSticker.h"

@implementation WorkManFiveFingerSticker

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.itemName = @"workManStartleSticker";
        self.backgroundImageName = @"workManStartleSticker";
    }
    return self;
}

+(WorkManFiveFingerSticker *) workManFiveFingerSticker{
    
    WorkManFiveFingerSticker * workManFiveFingerSticker = [[self alloc] init];
    return workManFiveFingerSticker;
}
@end
