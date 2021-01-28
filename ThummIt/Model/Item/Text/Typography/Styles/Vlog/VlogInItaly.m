//
//  VlogInItaly.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/29.
//

#import "VlogInItaly.h"

@implementation VlogInItaly

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"in Italy ",nil);
        self.fontName = @"KCC-Kimhoon-Regular";
        self.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
        self.fontSize = 40;
        self.bgImageName = @"inItalyBG";
        self.bgHeightPadding = -30;
        self.bgWidthPadding = -30;
    }
    return self;
}

+(VlogInItaly *)vlogInItaly{
    VlogInItaly* vlogInItaly = [[self alloc] init];
    return vlogInItaly;
}


@end
