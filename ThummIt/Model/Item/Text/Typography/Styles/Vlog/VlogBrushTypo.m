//
//  VlogBrushTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "VlogBrushTypo.h"

@implementation VlogBrushTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"돌잔치 브이로그",nil);
        self.fontName = @"UhBeeDoolDoolBold";
        self.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        self.bgImageName = @"brushBox";
        self.bgWidthPadding = 23;
        self.bgHeightPadding = 23;

    }
    return self;
}

+(VlogBrushTypo*)vlogBrushTypo{
    
    VlogBrushTypo* vlogBrushTypo = [[self alloc] init];
    return vlogBrushTypo;
    
}

@end
