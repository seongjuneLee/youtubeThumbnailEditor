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
        self.name = NSLocalizedString(@"RETRO",nil);
        self.fontName = @"AppleSDGothicNeo-UltraLight";
        self.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
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
