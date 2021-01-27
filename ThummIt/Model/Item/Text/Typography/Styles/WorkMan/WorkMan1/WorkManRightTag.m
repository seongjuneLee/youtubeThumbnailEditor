//
//  WorkManRightTag.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "WorkManRightTag.h"

@implementation WorkManRightTag

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"제철알바",nil);
        self.fontName = @"SangSangAnt";
        self.textColor = [UIColor blackColor];
        self.bgImageName = @"";
        self.bgHeightPadding = 0;
        self.bgWidthPadding = 0;
        self.fontSize = 20;
    }
    return self;
}

+(WorkManRightTag *)workManRightTag{
    WorkManRightTag *workManRightTag = [[self alloc] init];
        return workManRightTag;
    }

@end
