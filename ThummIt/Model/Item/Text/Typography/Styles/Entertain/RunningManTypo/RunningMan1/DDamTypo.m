//
//  DDamTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "DDamTypo.h"

@implementation DDamTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"(식은땀)",nil);
        self.fontName = @"TmoneyRoundWind-Regular";
        self.textColor = [UIColor whiteColor];
        self.canChangeColor = true;
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderWidth = 8;
        borderAtt.borderColor = [UIColor blackColor];
        
        self.bgTextAttributes = @[borderAtt];
    }
    return self;
}

+(DDamTypo*) ddamTypo{
    
    DDamTypo* ddamTypo = [[self alloc] init];
    return ddamTypo;
    
}


@end
