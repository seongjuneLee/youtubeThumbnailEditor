//
//  SeoYuGiCloudLogo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "SeoYuGiCloudLogoTypo.h"

@implementation SeoYuGiCloudLogoTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"세글자",nil);
        self.fontName = @"a2570";
        self.textColor = [UIColor colorWithRed:248/255.0f green:74/255.0f blue:30/255.0 alpha:1 ];
        self.fontSize = 30;
        self.bgImageName = @"SeoYUGiCloudLogo";
        self.bgWidthPadding = 5;
        self.cannotChangeColor = true;
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderColor = [UIColor colorWithRed:59/255.0f green:4/255.0f blue:1/255.0f alpha:1];
        borderAtt.borderWidth = 10;
        self.bgTextAttributes = @[borderAtt];
    }
    
    return self;
}

+(SeoYuGiCloudLogoTypo*) seoYuGiCloudLogoTypo{
    
    SeoYuGiCloudLogoTypo* seoYuGiCloudLogoTypo = [[self alloc] init];
    return seoYuGiCloudLogoTypo;
    
}

@end
