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
        self.fontName = @"NanumSquareOTFEB";
        self.textColor = [UIColor whiteColor];
        self.fontSize = 17;
        self.bgImageName = @"workManTalkBox";
        self.bgHeightPadding = 10;
        self.bgWidthPadding = 0;
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor blackColor];
        bgTextAttribute1.borderWidth = 8;
        
        BGTextAttribute *attribute1 = [[BGTextAttribute alloc] init];
        attribute1.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
                attribute1.shadowOffset = CGPointMake(1, 1);
        
        self.bgTextAttributes = @[bgTextAttribute1,attribute1];

    }
    return self;
}

+(WorkManTalkWrite *)workManTalkWrite{
    WorkManTalkWrite *workManTalkWrite = [[self alloc] init];
    return workManTalkWrite;
}

@end
