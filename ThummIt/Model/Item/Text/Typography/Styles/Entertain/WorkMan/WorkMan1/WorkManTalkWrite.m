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
        self.textColor = UIColor.whiteColor;
        self.bgImageName = @"workManTalkBox";
        self.bgHeightPadding = 30;
        self.bgWidthPadding = 30;
        self.canChangeColor = true;
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = UIColor.blackColor;
        bgTextAttribute1.borderWidth = 8;
        
        BGTextAttribute *shadowAtt = [[BGTextAttribute alloc] init];
        shadowAtt.shadowColor = UIColor.blackColor;
        shadowAtt.shadowOffset = CGPointMake(1.5, 1.5);
        
        self.bgTextAttributes = @[bgTextAttribute1, shadowAtt];

    }
    return self;
}

+(WorkManTalkWrite *)workManTalkWrite{
    WorkManTalkWrite *workManTalkWrite = [[self alloc] init];
    return workManTalkWrite;
}

@end
