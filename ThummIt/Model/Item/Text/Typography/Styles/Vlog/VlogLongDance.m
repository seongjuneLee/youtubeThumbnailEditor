//
//  VlogLongDance.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/29.
//

#import "VlogLongDance.h"

@implementation VlogLongDance

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"댄스 동아리 연습 ",nil);
        self.fontName = @"UhBeepudingBold";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
        self.fontSize = 40;
        self.bgImageName = @"longDanceBG";
        self.bgHeightPadding = -6;
        self.bgWidthPadding =55;    }
    return self;
}

+(VlogLongDance *)vlogLongDance{
    VlogLongDance* vlogLongDance = [[self alloc] init];
    return vlogLongDance;
}
@end
