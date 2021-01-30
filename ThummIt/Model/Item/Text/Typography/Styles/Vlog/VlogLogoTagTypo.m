//
//  VlogLogoTagTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "VlogLogoTagTypo.h"

@implementation VlogLogoTagTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"ㅎ",nil);
        self.fontName = @"OTRecipekoreaM";
        self.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        self.fontSize = TEXT_FONT_SIZE + 20;

    }
    return self;
}

+(VlogLogoTagTypo*)vlogLogoTagTypo{
    
    VlogLogoTagTypo* vlogLogoTagTypo = [[self alloc] init];
    return vlogLogoTagTypo;
    
}

@end
