//
//  RuleTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "RuleTypo.h"

@implementation RuleTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"Rule",nil);
        self.fontName = @"NanumSquareOTFEB";
        self.fontSize = 50;
        self.textColor = [UIColor colorWithRed:249/255.0 green:253/255.0 blue:92/255.0 alpha:1.0];
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 8;
        self.bgTextAttributes = @[borderAtt];
    
        self.bgImageName = @"Rule";
//        self.bgContentMode = UIViewContentModeScaleAspectFit;
        self.bgWidthPadding = 10;
        self.bgHeightPadding = 60;
    }
        //이미지조정, 기울이기
    return self;
}

+(RuleTypo*) ruleTypo{
    
    RuleTypo* ruleTypo = [[self alloc] init];
    return ruleTypo;
}

@end
