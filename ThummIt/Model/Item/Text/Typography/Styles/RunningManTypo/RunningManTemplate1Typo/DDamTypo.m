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
        self.fontSize = 30;
        self.textColor = [UIColor whiteColor];
        self.borderRoundCorner = true;

        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.borderWidth = 10;
        attribute.borderColor = [UIColor blackColor];
        
        self.bgTextAttributes = @[attribute];
    }
    return self;
}

+(DDamTypo*) ddamTypo{
    
    DDamTypo* ddamTypo = [[self alloc] init];
    return ddamTypo;
    
}


@end
