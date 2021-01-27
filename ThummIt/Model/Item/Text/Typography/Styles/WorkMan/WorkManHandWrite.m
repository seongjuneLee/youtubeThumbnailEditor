//
//  WorkManHandWrite.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "WorkManHandWrite.h"

@implementation WorkManHandWrite

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"(무대난입)",nil);
        self.fontName = @"NanumGothicBold";
        self.textColor = [UIColor blackColor];
        self.fontSize = TEXT_FONT_SIZE;
    }
    return self;
}

+(WorkManHandWrite *)workManHandWrite{
    WorkManHandWrite *workManHandWrite = [[self alloc] init];
    return workManHandWrite;
}

@end
