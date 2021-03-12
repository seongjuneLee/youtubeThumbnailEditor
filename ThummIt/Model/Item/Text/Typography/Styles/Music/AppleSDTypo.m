//
//  AppleSDTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/12.
//

#import "AppleSDTypo.h"

@implementation AppleSDTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"copyright",nil);
        self.fontName = @"AppleSDGothicNeo-UltraLight";
        self.textColor = [UIColor whiteColor];
        self.canChangeColor = true;
        self.obliqueValue = 0.0;
        self.fontInterval = 5.0;
    }
    return self;
}

+(AppleSDTypo *)appleSDTypo{
    AppleSDTypo *appleSDTypo = [[self alloc] init];
    return appleSDTypo;
    
}

@end
