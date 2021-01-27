//
//  WhatTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "WhatTypo.h"

@implementation WhatTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"뭐?",nil);
        self.fontName = @"NanumGothicOTFBold";
        self.fontSize = 30;
        self.textColor = [UIColor colorWithRed:244/255.0 green:185/255.0 blue:46/255.0 alpha:1.0];
        //244, 185, 46
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 6;
        
        self.bgTextAttributes = @[borderAtt];
    }
    
        self.bgImageName = @"What";
        self.bgContentMode = UIViewContentModeScaleAspectFill;
    
        //기울기효과필요
    return self;
}

+(WhatTypo*) whatTypo{
    
    WhatTypo* whatTypo = [[self alloc] init];
    return whatTypo;
    
}

@end
