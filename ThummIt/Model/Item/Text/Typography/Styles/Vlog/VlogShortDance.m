//
//  VlogShortDance.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/29.
//

#import "VlogShortDance.h"

@implementation VlogShortDance

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"브이로그 ",nil);
        self.fontName = @"UhBeepudingBold";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
        self.bgImageName = @"shortDance";
        self.bgHeightPadding = -30;
        self.bgWidthPadding = 45;    }
    return self;
}

+(VlogShortDance *)vlogShortDance{
    VlogShortDance* vlogShortDance = [[self alloc] init];
    return vlogShortDance;
}
@end
