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
        self.textColor = [UIColor whiteColor];
        self.borderColor = [UIColor blackColor];
        self.borderWidth = -5;
        self.fontSize = 50;

    }
    //border radius 기능 필요
    //소오름 괄호 위치 애매..
    return self;
}

+(CowRiseTypo*) cowRiseTypo{
    
    CowRiseTypo* cowRiseTypo = [[self alloc] init];
    return cowRiseTypo;
    
}

@end
