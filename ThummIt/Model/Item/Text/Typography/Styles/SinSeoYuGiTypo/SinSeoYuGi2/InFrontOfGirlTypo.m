//
//  InFrontOfGirlTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "InFrontOfGirlTypo.h"

@implementation InFrontOfGirlTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"여사친 앞에서",nil);
        self.fontName = @"ELANDNiceM";
        self.fontSize = 50;
        self.textColor = [UIColor colorWithRed:253/255.0f green:169/255.0f blue:41/255.0 alpha:1 ];
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        BGTextAttribute *bgTextAttribute2 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor colorWithRed:84/255.0f green:8/255.0f blue:8/255.0f alpha:1];
        bgTextAttribute2.borderColor = [UIColor colorWithRed:145/255.0f green:69/255.0f blue:34/255.0f alpha:1];
        bgTextAttribute1.borderWidth = 8;
        bgTextAttribute2.borderWidth = 10;
        
        self.bgTextAttributes = @[bgTextAttribute1 , bgTextAttribute2];
    }
 //대조작업필요
    
    return self;
}

+(InFrontOfGirlTypo*) inFrontOfGirlTypo{
    
    InFrontOfGirlTypo* inFrontOfGirlTypo = [[self alloc] init];
    return inFrontOfGirlTypo;
    
}

@end
