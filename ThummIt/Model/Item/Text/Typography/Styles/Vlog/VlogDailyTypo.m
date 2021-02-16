//
//  VlogDailyTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "VlogDailyTypo.h"

@implementation VlogDailyTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"MY DAILY VLOG",nil);
        self.fontName = @"NanumMyeongjoOTFExtraBold";
        self.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.75];
        self.fontSize = 55;

    }
    return self;
}

+(VlogDailyTypo*)vlogDailyTypo{
    
    VlogDailyTypo* vlogDailyTypo = [[self alloc] init];
    return vlogDailyTypo;
    
}

@end
