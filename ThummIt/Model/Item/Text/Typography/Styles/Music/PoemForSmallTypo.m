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
        self.name = NSLocalizedString(@"작은 것",nil);
        self.fontName = @"YUN-BONG-GIL";
        self.textColor = [UIColor whiteColor];
        self.canChangeColor = true;

        BGTextAttribute *shadow = [[BGTextAttribute alloc] init];
        shadow.shadowOffset = CGPointMake(2, 2);
        shadow.shadowColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1.0];
        
        self.bgTextAttributes = @[shadow];

    }
    return self;
}

+(PoemForSmallTypo*)poemForSmallTypo{
    PoemForSmallTypo* poemForSmallTypo = [[self alloc] init];
    
    return poemForSmallTypo;
    
}

@end
