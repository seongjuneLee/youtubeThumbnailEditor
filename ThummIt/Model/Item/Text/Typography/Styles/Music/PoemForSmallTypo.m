//
//  PoemForSmallTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "PoemForSmallTypo.h"

@implementation PoemForSmallTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"작은 것들을 위한 시",nil);
        self.fontName = @"YUN-BONG-GIL";
        self.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
        self.canChangeColor = true;
        self.obliqueValue = 0.0;
    }
    return self;
}

+(PoemForSmallTypo*)poemForSmallTypo{
    PoemForSmallTypo* poemForSmallTypo = [[self alloc] init];
    
    return poemForSmallTypo;
    
}

@end
