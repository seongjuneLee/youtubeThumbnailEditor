//
//  WorkManFiveFingerSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "WorkManStartleSticker.h"

@implementation WorkManStartleSticker

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.itemName = @"workManStartleSticker";
        self.backgroundImageName = @"workManStartleSticker";
    }
    return self;
}

+(WorkManStartleSticker *) workManStartleSticker{
    
    WorkManStartleSticker * workManStartleSticker = [[self alloc] init];
    return workManStartleSticker;
}
@end
