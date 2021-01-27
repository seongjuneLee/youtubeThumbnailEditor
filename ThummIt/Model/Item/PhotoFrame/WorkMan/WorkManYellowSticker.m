//
//  WorkManYellowSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "WorkManYellowSticker.h"

@implementation WorkManYellowSticker

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.itemName = @"workManYellowSticker";
        self.backgroundImageName = @"workManYellowSticker";
    }
    return self;
}

+(WorkManYellowSticker *) workManYellowSticker{
    
    WorkManYellowSticker * workManYellowSticker = [[self alloc] init];
    return workManYellowSticker;
}

@end
