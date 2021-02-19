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
        self.textColor = [UIColor whiteColor];
        self.bgImageName = @"blueMoon";
        self.bgHeightPadding = 20;
        self.bgWidthPadding = 20;
        BGTextAttribute *shadowAtt = [[BGTextAttribute alloc] init];
        shadowAtt.shadowColor =[UIColor colorWithRed:39/255.0 green:60/255.0 blue:184/255.0 alpha:1.0];
        shadowAtt.shadowOffset = CGPointMake(5, 5);
        
        BGTextAttribute *shadowAtt2 = [[BGTextAttribute alloc] init];
        shadowAtt2.shadowColor =[UIColor colorWithRed:39/255.0 green:60/255.0 blue:184/255.0 alpha:1.0];
        shadowAtt2.shadowOffset = CGPointMake(6, 6);
        
        BGTextAttribute *shadowAtt3 = [[BGTextAttribute alloc] init];
        shadowAtt3.shadowColor =[UIColor colorWithRed:39/255.0 green:60/255.0 blue:184/255.0 alpha:1.0];
        shadowAtt3.shadowOffset = CGPointMake(7, 7);
        
        BGTextAttribute *shadowAtt4 = [[BGTextAttribute alloc] init];
        shadowAtt4.shadowColor =[UIColor colorWithRed:39/255.0 green:60/255.0 blue:184/255.0 alpha:1.0];
        shadowAtt4.shadowOffset = CGPointMake(8, 8);
        
        
        
        self.bgTextAttributes = @[shadowAtt,shadowAtt2,shadowAtt3,shadowAtt4];
        
    }
    return self;
}

+(BlueMoonTypo*) blueMoonTypo{
    
    BlueMoonTypo* blueMoonTypo = [[self alloc] init];
    return blueMoonTypo;
    
}

@end
