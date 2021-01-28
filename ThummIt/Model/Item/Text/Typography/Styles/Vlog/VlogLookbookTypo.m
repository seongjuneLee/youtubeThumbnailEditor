//
//  VlogLookbookTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "VlogLookbookTypo.h"

@implementation VlogLookbookTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"룩북",nil);
        self.fontName = @"BMJUAOTF";
        self.textColor = [UIColor colorWithRed:62/255.0 green:50/255.0 blue:37/255.0 alpha:1];
        self.fontSize = TEXT_FONT_SIZE;
    }
    return self; 
}

+(VlogLookbookTypo*)vlogLookbookTypo{
    
    VlogLookbookTypo* vlogLookbookTypo = [[self alloc] init];
    return vlogLookbookTypo;
    
}

@end
