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
        
        self.name = NSLocalizedString(@"Rule",nil); //italic
        self.fontName = @"NanumSquareOTFEB";
        self.fontSize = TEXT_FONT_SIZE;
        self.textColor = [UIColor colorWithRed:249/255.0 green:253/255.0 blue:92/255.0 alpha:1.0];
        self.bgImageName = @"Rule";
        self.bgWidthPadding = 7;
        self.bgHeightPadding = 25;
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 5;
        
        self.bgTextAttributes = @[borderAtt];
        
    }
    return self;
}

+(RuleTypo*) ruleTypo{
    
    RuleTypo* ruleTypo = [[self alloc] init];
    return ruleTypo;
}

@end
