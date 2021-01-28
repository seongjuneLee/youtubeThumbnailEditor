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
        self.name = NSLocalizedString(@"서유기",nil);
        self.fontName = @"a2570";
        self.textColor = [UIColor colorWithRed:248/255.0f green:74/255.0f blue:30/255.0 alpha:1 ];
        self.borderColor = [UIColor colorWithRed:59/255.0f green:4/255.0f blue:1/255.0f alpha:1];
        self.borderWidth = -3;
        self.fontSize = 35;
        self.bgImageName = @"SeoYUGiCloudLogo";
        self.bgContentMode = UIViewContentModeScaleAspectFit;
        self.bgHeightPadding = 50;
        self.bgCenterYDelta = 0;
        

    }
//대조작업필요
//글자 수 많아지면서 Bgview xy방향으로 같이커져서 overlap됨
//Collectionview image와 view image가 다름
    return self;
}

+(SeoYuGiCloudLogoTypo*) seoYuGiCloudLogoTypo{
    
    SeoYuGiCloudLogoTypo* seoYuGiCloudLogoTypo = [[self alloc] init];
    return seoYuGiCloudLogoTypo;
    
}

@end
