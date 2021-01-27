//
//  CowRiseTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "CowRiseTypo.h"

@implementation CowRiseTypo


-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"(소오오ㅗ름)",nil);
        self.fontName = @"NotoSansKannada-Bold";
        self.fontSize = 50;
        self.textColor = [UIColor whiteColor];
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor blackColor];
        bgTextAttribute1.borderWidth = 7.5;
       
        self.bgTextAttributes = @[bgTextAttribute1];
        self.borderColor = [UIColor blackColor];
        self.borderWidth = -5;

    }
    //소오름 괄호 위치 애매..
    return self;
}

+(CowRiseTypo*) cowRiseTypo{
    
    CowRiseTypo* cowRiseTypo = [[self alloc] init];
    return cowRiseTypo;
    
}

@end
