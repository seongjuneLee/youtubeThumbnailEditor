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
        bgTextAttribute1.borderColor = [UIColor blackColor];
        bgTextAttribute1.borderWidth = 20;
       
        self.bgTextAttributes = @[bgTextAttribute1];

    }
    return self;
}

+(SeoYuGiCowRiseTypo*) seoYuGiCowRiseTypo{
    
    SeoYuGiCowRiseTypo* seoYuGiCowRiseTypo = [[self alloc] init];
    return seoYuGiCowRiseTypo;
    
}

@end
