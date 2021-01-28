//
//  VlogCookingTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "VlogCookingTypo.h"

@implementation VlogCookingTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"Cooking",nil);
        self.fontName = @"Untitled";
        self.textColor = [UIColor colorWithRed:255/255.0 green:200/255.0 blue:100/255.0 alpha:1];
        self.fontSize = TEXT_FONT_SIZE;
        
    }
    return self;
}

+(VlogCookingTypo*)vlogCookingTypo{
    
    VlogCookingTypo* vlogCookingTypo = [[self alloc] init];
    return vlogCookingTypo;
    
}

@end
