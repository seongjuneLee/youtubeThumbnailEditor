//
//  WorkManBlueTitle.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "WorkManBlueTitle.h"

@implementation WorkManBlueTitle

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"대학축제 알바",nil);
        self.fontName = @"S-CoreDream-9Black";
        self.textColor = [UIColor blueColor];
        self.fontSize = TEXT_FONT_SIZE;
    }
    return self;
}

+(WorkManBlueTitle *)workManBlueTitle{
    WorkManBlueTitle *workManBlueTitle = [[self alloc] init];
    return workManBlueTitle;
}

@end
