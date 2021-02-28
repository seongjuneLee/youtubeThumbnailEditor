//
//  VlogMakingFilmTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "VlogMakingFilmTypo.h"

@implementation VlogMakingFilmTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"MAKING\nFILM",nil);
        self.fontName = @"KOTRA_BOLD-Bold";
        self.textColor = [UIColor colorWithRed:38/255.0 green:179/255.0 blue:213/255.0 alpha:1];
        self.canChangeColor = true;
    }
    return self;
}

+(VlogMakingFilmTypo*)vlogMakingFilmTypo{
    
    VlogMakingFilmTypo* vlogMakingFilmTypo = [[self alloc] init];
    return vlogMakingFilmTypo;
    
}

@end
