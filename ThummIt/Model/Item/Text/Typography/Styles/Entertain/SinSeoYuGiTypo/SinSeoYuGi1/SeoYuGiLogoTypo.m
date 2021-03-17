//
//  SeoYuGiLogoTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "SeoYuGiLogoTypo.h"

@implementation SeoYuGiLogoTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"서유기",nil); //italic
        self.fontName = @"a2570";
        self.textColor = [UIColor colorWithRed:248/255.0f green:74/255.0f blue:30/255.0 alpha:1 ];
        self.fontSize = 50;
        self.obliqueValue = 0.14;
        self.canChangeColor = true;
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor colorWithRed:59/255.0f green:4/255.0f blue:1/255.0f alpha:1];
        borderAtt.borderWidth = 5;
        borderAtt.obliqueValue = 0.14;
        self.bgTextAttributes = @[borderAtt];
       
    }
    return self;
}

+(SeoYuGiLogoTypo*) seoYuGiLogoTypo{
    
    SeoYuGiLogoTypo* seoYuGiLogoTypo = [[self alloc] init];
    return seoYuGiLogoTypo;
    
}


@end
