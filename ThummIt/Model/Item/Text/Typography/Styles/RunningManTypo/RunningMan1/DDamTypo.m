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
        self.fontSize = TEXT_FONT_SIZE;
        self.textColor = [UIColor whiteColor];

        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderWidth = 7;
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
