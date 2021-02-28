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
        
        self.name = NSLocalizedString(@"분위기 파악 못해?!",nil); //italic
        self.fontName = @"SDMiSaeng";
        self.textColor = [UIColor whiteColor];
        self.obliqueValue = 0.2;
        self.canChangeColor = true;
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 6;
        borderAtt.obliqueValue = 0.2;
        
        BGTextAttribute *shadowAtt1 = [[BGTextAttribute alloc] init];
        shadowAtt1.shadowColor =[UIColor blackColor];
        shadowAtt1.shadowOffset = CGPointMake(0.5, 0.5);
        shadowAtt1.obliqueValue = 0.2;
        
        BGTextAttribute *shadowAtt2 = [[BGTextAttribute alloc] init];
        shadowAtt2.shadowColor =[UIColor blackColor];
        shadowAtt2.shadowOffset = CGPointMake(1, 1);
        shadowAtt2.obliqueValue = 0.2;
        
        BGTextAttribute *shadowAtt3 = [[BGTextAttribute alloc] init];
        shadowAtt3.shadowColor =[UIColor blackColor];
        shadowAtt3.shadowOffset = CGPointMake(1.5, 1.5);
        shadowAtt3.obliqueValue = 0.2;
        
        self.bgTextAttributes = @[borderAtt, shadowAtt1, shadowAtt2, shadowAtt3];
    }
    return self;
}

+(AtmosphereTypo*) atmosphereTypo{
    
    AtmosphereTypo* atmosphereTypo = [[self alloc] init];
    return atmosphereTypo;
    
}


@end
