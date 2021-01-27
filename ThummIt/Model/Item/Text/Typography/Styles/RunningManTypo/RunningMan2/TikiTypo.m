//
//  TikiTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "TikiTypo.h"

@implementation TikiTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"환상의 티키타카",nil);
        self.fontName = @"BMHANNA11yrsoldOTF";
        self.fontSize = 50;
        self.textColor = [UIColor whiteColor];
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        BGTextAttribute *shadowAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 8;
        shadowAtt.shadowColor =[UIColor blackColor];
        shadowAtt.shadowOffset = CGPointMake(5, 5);
        shadowAtt.shadowRadius = 1.0;
        self.bgTextAttributes = @[borderAtt, shadowAtt];
    }
    return self;
}

+(TikiTypo*) tikiTypo{
    
    TikiTypo* tikiTypo = [[self alloc] init];
    return tikiTypo;
    
}


@end
