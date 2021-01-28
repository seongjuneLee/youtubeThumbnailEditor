//
//  BlueMoonTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "BlueMoonTypo.h"

@implementation BlueMoonTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"SBC\nWOW",nil);
        self.fontName = @"NanumSquareOTFEB";
        self.fontSize = 50;
        
        self.textColor = [UIColor whiteColor];
        BGTextAttribute *shadowAtt = [[BGTextAttribute alloc] init];
        shadowAtt.shadowColor =[UIColor colorWithRed:39/255.0 green:60/255.0 blue:184/255.0 alpha:1.0];
        shadowAtt.shadowOffset = CGPointMake(5, 5);
        
        self.bgTextAttributes = @[shadowAtt];
        
        self.bgImageName = @"blueMoon";
        self.bgContentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

+(BlueMoonTypo*) blueMoonTypo{
    
    BlueMoonTypo* blueMoonTypo = [[self alloc] init];
    return blueMoonTypo;
    
}

@end
