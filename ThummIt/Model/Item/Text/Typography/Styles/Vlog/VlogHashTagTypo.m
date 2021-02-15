//
//  VlogHashTagTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/29.
//

#import "VlogHashTagTypo.h"

@implementation VlogHashTagTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"#HashTag",nil);
        self.fontName = @"WindyLavender";
        self.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        self.bgImageName = @"vlogHashTagBox";
        self.bgWidthPadding = 7;
        self.bgHeightPadding = 10;

    }
    return self;
}

+(VlogHashTagTypo*)vlogHashTagTypo{
    
    VlogHashTagTypo* vlogHashTagTypo = [[self alloc] init];
    return vlogHashTagTypo;
    
}

@end
