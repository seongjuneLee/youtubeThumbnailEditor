//
//  LalalandTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/12.
//

#import "LalalandTypo.h"

@implementation LalalandTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"라라랜드",nil);
        self.fontName = @"S-CoreDream-7ExtraBold";
        self.textColor = [UIColor whiteColor];
        self.obliqueValue = 0.2;
        self.fontSize = 40;
        
        BGTextAttribute *shadow = [[BGTextAttribute alloc] init];
        shadow.shadowOffset = CGPointMake(0, 1.5);
        shadow.shadowColor = [UIColor blackColor];
        shadow.obliqueValue = 0.2;
        
        self.bgTextAttributes = @[shadow];
    }
    return self;
}

+(LalalandTypo *)lalalandTypo{
    LalalandTypo *lalalandTypo = [[self alloc] init];
    return lalalandTypo;
    
}


@end
