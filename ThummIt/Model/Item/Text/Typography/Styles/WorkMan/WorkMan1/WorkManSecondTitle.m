//
//  WorkManSecondTitle.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/29.
//

#import "WorkManSecondTitle.h"

@implementation WorkManSecondTitle

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"안받을게요",nil);
        self.fontName = @"S-CoreDream-9Black";
        self.textColor = [UIColor whiteColor];
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor blackColor];
        bgTextAttribute1.borderWidth = 7;
        self.bgTextAttributes = @[bgTextAttribute1];
    }
    return self;
}

+(WorkManSecondTitle *)workManSecondTitle{
    WorkManSecondTitle *workManSecondTitle = [[self alloc] init];
        return workManSecondTitle;
    }


@end
