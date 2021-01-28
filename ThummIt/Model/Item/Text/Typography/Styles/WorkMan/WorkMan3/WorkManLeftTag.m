//
//  WorkManTag2.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "WorkManLeftTag.h"

@implementation WorkManLeftTag

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"기업탐방",nil);
        self.fontName = @"S-CoreDream-9Black";
        self.textColor = [UIColor colorWithRed:(20/255.0) green:(48/255.0) blue:(209/255.0) alpha:1] ;
        self.fontSize = 25;
        self.bgImageName = @"waveYellowSquare";
        self.bgHeightPadding = 0;
        self.bgWidthPadding = 0;
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor blackColor];
        
        bgTextAttribute1.borderWidth = 10;
        
        
        self.bgTextAttributes = @[bgTextAttribute1];
    }
    return self;
}

+(WorkManLeftTag *)workManLeftTag{
    WorkManLeftTag *workManLeftTag = [[self alloc] init];
        return workManLeftTag;
}

@end
