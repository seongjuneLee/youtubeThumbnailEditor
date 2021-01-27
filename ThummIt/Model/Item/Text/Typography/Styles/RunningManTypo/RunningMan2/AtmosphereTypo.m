//
//  Atmosphere.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "AtmosphereTypo.h"

@implementation AtmosphereTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"분위기 파악 못해?!",nil);
        self.fontName = @"SDMiSaeng";
        self.fontSize = 50;
        self.textColor = [UIColor whiteColor];
        
        //미완
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        BGTextAttribute *shadowAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 6;
        shadowAtt.shadowColor =[UIColor grayColor];
        shadowAtt.shadowOffset = CGPointMake(3, 3);
        self.bgTextAttributes = @[borderAtt, shadowAtt];
        //기울어짐 필요
    }
    return self;
}

+(AtmosphereTypo*) atmosphereTypo{
    
    AtmosphereTypo* atmosphereTypo = [[self alloc] init];
    return atmosphereTypo;
    
}


@end
