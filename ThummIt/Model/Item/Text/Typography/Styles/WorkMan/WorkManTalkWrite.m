//
//  WorkManTalkWrite.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "WorkManTalkWrite.h"

@implementation WorkManTalkWrite

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"소리질러!!!!!",nil);
        self.fontName = @"NanumSquareOTFB";
        self.textColor = [UIColor blackColor];
        self.fontSize = TEXT_FONT_SIZE;

    }
    return self;
}

+(WorkManTalkWrite *)workManTalkWrite{
    WorkManTalkWrite *workManTalkWrite = [[self alloc] init];
    return workManTalkWrite;
}

@end
