//
//  WorkManFirstTitle.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "WorkManRedTitle.h"

@implementation WorkManRedTitle

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"행사비",nil);
        self.fontName = @"S-CoreDream-9Black";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(248/255.0) blue:(61/255.0) alpha:(1)];

        self.fontSize = TEXT_FONT_SIZE;
    }
    return self;
}

+(WorkManRedTitle *)workManRedTitle{
    WorkManRedTitle *workManRedTitle = [[self alloc] init];
    return workManRedTitle;
}

@end
