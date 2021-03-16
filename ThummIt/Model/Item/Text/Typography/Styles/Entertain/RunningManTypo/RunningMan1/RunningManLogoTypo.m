//
//  WorkingManLogoTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "RunningManLogoTypo.h"

@implementation RunningManLogoTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"러닝맨",nil);
        self.fontName = @"BMHANNA11yrsoldOTF";
        self.textColor = [UIColor colorWithRed:241/255.0 green:233/255.0 blue:38/255.0 alpha:1.0];
        self.fontSize = 200;
        self.canChangeColor = true;
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderWidth = 10;
        borderAtt.borderColor = [UIColor colorWithRed:57/255.0 green:104/255.0 blue:176/255.0 alpha:1.0];
        
        self.bgTextAttributes = @[borderAtt];
    }
    return self;
}

+(RunningManLogoTypo*) runningManLogoTypo{
    
    RunningManLogoTypo* runningManLogoTypo = [[self alloc] init];
    return runningManLogoTypo;
    
}


@end
