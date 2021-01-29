//
//  KnockOutTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "KnockOutTypo.h"

@implementation KnockOutTypo
-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"혼절직전",nil);
        self.fontName = @"JejuHallasanOTF";
        self.fontSize = TEXT_FONT_SIZE;
        self.textColor = [UIColor colorWithRed:232/255.0 green:30/255.0 blue:53/255.0 alpha:1.0];

        BGTextAttribute *border1Att = [[BGTextAttribute alloc] init];
        
        border1Att.borderColor = [UIColor blackColor];
        border1Att.borderWidth = 8;
        
        BGTextAttribute *border2Att = [[BGTextAttribute alloc] init];
        border2Att.borderColor = [UIColor whiteColor];
        border2Att.borderWidth = 18;
        
        self.bgTextAttributes = @[border1Att, border2Att];
    }
    return self;
}

+(KnockOutTypo*) knockOutTypo{
    
    KnockOutTypo* knockOutTypo = [[self alloc] init];
    return knockOutTypo;
    
}

@end
