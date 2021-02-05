//
//  VlogSummerTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "VlogSummerTypo.h"

@implementation VlogSummerTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"Summer Story",nil);
        self.fontName = @"SangSangShinOTF";
        self.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];

    }
    return self;
}

+(VlogSummerTypo*)vlogSummerTypo{
    
    VlogSummerTypo* vlogSummerTypo = [[self alloc] init];
    return vlogSummerTypo;
    
}

@end
