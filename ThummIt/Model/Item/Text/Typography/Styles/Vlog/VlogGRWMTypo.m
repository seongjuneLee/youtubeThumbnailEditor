//
//  VlogGRWMTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/29.
//

#import "VlogGRWMTypo.h"

@implementation VlogGRWMTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"GRWM",nil);
        self.fontName = @"Cafe24Shiningstar";
        self.textColor = [UIColor colorWithRed:253/255.0 green:253/255.0 blue:214/255.0 alpha:1];
        self.fontSize = 100;
        
    }
    return self;
}

+(VlogGRWMTypo*)vlogGRWMTypo{
    
    VlogGRWMTypo* vlogGRWMTypo = [[self alloc] init];
    return vlogGRWMTypo;
    
}

@end
