//
//  VlogCompany.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "VlogCompany.h"

@implementation VlogCompany

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"회사 vlog",nil);
        self.fontName = @"BMJUAOTF";
        self.textColor = [UIColor colorWithRed:(100/255.0) green:(29/255.0) blue:(60/255.0) alpha:1];
        self.bgImageName = @"webDesignerBG";
        self.bgHeightPadding = 5;
        self.bgWidthPadding = 40;
        self.backgroundColorAlsoChange = true;
        self.canChangeColor = true;
    }
    return self;
}

+(VlogCompany *)vlogCompany{
    VlogCompany* vlogCompany = [[self alloc] init];
    return vlogCompany;
}

@end
