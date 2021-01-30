//
//  "SeoYuGiCowRiseTypo.h".m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "SeoYuGiCowRiseTypo.h"

@implementation SeoYuGiCowRiseTypo


-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"(소오오ㅗ름)",nil);
        self.fontName = @"NotoSansKannada-Bold";
        self.fontSize = TEXT_FONT_SIZE;
        self.textColor = [UIColor whiteColor];
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor whiteColor];
        bgTextAttribute1.borderWidth = 3;
        
        BGTextAttribute *bgTextAttribute2 = [[BGTextAttribute alloc] init];
        bgTextAttribute2.borderColor = [UIColor blackColor];
        bgTextAttribute2.borderWidth = 20;
       
        self.bgTextAttributes = @[bgTextAttribute1, bgTextAttribute2];

    }
    return self;
}

+(SeoYuGiCowRiseTypo*) seoYuGiCowRiseTypo{
    
    SeoYuGiCowRiseTypo* seoYuGiCowRiseTypo = [[self alloc] init];
    return seoYuGiCowRiseTypo;
    
}

@end
