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
        
        self.name = NSLocalizedString(@"뭐?",nil); //italic
        self.fontName = @"NanumGothicOTFBold";
        self.fontSize = TEXT_FONT_SIZE;
        self.textColor = [UIColor colorWithRed:244/255.0 green:185/255.0 blue:46/255.0 alpha:1.0];
        self.bgImageName = @"What";
        self.bgWidthPadding = 5;
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor blackColor];
        borderAtt.borderWidth = 6;
        
        self.bgTextAttributes = @[borderAtt];
    }
        
    return self;
}

+(WhatTypo*) whatTypo{
    
    WhatTypo* whatTypo = [[self alloc] init];
    return whatTypo;
    
}

@end
