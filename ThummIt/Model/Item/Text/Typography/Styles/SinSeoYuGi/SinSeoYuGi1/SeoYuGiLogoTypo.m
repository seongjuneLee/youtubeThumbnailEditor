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
        
        self.name = NSLocalizedString(@"서유기",nil);
        self.fontName = @"a2570";
        self.textColor = [UIColor colorWithRed:248/255.0f green:74/255.0f blue:30/255.0 alpha:1 ];
        self.borderColor = [UIColor colorWithRed:59/255.0f green:4/255.0f blue:1/255.0f alpha:1];
        self.borderWidth = -3;
    //  bgTextAttributes.borderWidth =
        self.fontSize = 20;
    }
    return self;
}

+(SeoYuGiLogoTypo*) seoYuGiLogoTypo{
    
    SeoYuGiLogoTypo* seoYuGiLogoTypo = [[self alloc] init];
    return seoYuGiLogoTypo;
    
}


@end
