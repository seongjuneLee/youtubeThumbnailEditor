//
//  VlogLogoTagTypo.m
//  ThummIt
//
//  Created by ์กฐ์ฌํ on 2021/01/28.
//

#import "VlogLogoTagTypo.h"

@implementation VlogLogoTagTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"ใ",nil);
        self.fontName = @"OTRecipekoreaM";
        self.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        self.fontSize = 130;
        self.canChangeColor = true;
    }
    return self;
}

+(VlogLogoTagTypo*)vlogLogoTagTypo{
    
    VlogLogoTagTypo* vlogLogoTagTypo = [[self alloc] init];
    return vlogLogoTagTypo;
    
}

@end
