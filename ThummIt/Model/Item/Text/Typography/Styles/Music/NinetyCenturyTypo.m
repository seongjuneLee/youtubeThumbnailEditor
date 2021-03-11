//
//  NinetyCenturyTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "NinetyCenturyTypo.h"

@implementation NinetyCenturyTypo


-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"1990s PLAYLIST",nil);
        self.fontName = @"BlackHanSans-Black";
        self.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
        self.canChangeColor = true;
        self.obliqueValue = 0.0;
    }
    return self;
}

+(NinetyCenturyTypo *)ninetyCenturyTypo{
    NinetyCenturyTypo *ninetyCenturyTypo = [[self alloc] init];
    return ninetyCenturyTypo;
    
}

@end
