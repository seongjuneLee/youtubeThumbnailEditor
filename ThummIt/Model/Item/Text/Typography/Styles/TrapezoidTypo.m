//
//  TrapezoidTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/21.
//

#import "TrapezoidTypo.h"

@implementation TrapezoidTypo

-(id)init{
    self = [super init];
    if (self) {

        self.name = NSLocalizedString(@"trapezoidTypo",nil);
        self.fontName = @"KOTRA_BOLD-Bold";
        self.textColor = [UIColor whiteColor];
        self.bgImageName = @"trapezoidBox";
        self.bgHeightPadding = 250;
        self.bgWidthPadding = 250;
    }
    return self;
}

+(TrapezoidTypo*)trapezoidTypo{
    
    TrapezoidTypo* trapezoidTypo = [[self alloc] init];
    return trapezoidTypo;
    
}

@end
