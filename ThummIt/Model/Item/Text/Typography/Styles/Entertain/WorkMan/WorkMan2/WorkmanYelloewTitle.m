//
//  WorkmanYelloewTitle.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "WorkmanYelloewTitle.h"

@implementation WorkmanYelloewTitle

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"유튜브",nil);
        self.fontName = @"S-CoreDream-9Black";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:(1)];
        self.canChangeColor = true;
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor blackColor];
        bgTextAttribute1.borderWidth = 5;
        self.bgTextAttributes = @[bgTextAttribute1];
    }
    return self;
}

+(WorkmanYelloewTitle *)workmanYelloewTitle{
    WorkmanYelloewTitle *workmanYelloewTitle = [[self alloc] init];
        return workmanYelloewTitle;
}


@end
