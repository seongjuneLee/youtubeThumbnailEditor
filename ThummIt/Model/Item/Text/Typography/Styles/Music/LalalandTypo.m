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
        self.name = NSLocalizedString(@"라라랜드\nOST",nil);
        self.fontName = @"S-CoreDream-7ExtraBoldk";
        self.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
        self.canChangeColor = true;
        self.obliqueValue = 0.0;
    }
    return self;
}

+(LalalandTypo *)lalalandTypo{
    LalalandTypo *lalalandTypo = [[self alloc] init];
    return lalalandTypo;
    
}


@end
