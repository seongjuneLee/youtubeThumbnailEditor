//
//  VlogItaly.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/29.
//

#import "VlogItaly.h"

@implementation VlogItaly

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"vlog_Italy ",nil);
        self.fontName = @"AppleSDGothicNeo-Bold";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
        self.bgImageName = @"italyBG";
        self.bgHeightPadding = 100;
        self.bgWidthPadding = 125;
        
    }
    return self;
}


+(VlogItaly *)vlogItaly{
    VlogItaly* vlogItaly = [[self alloc] init];
    return vlogItaly;
}

@end
