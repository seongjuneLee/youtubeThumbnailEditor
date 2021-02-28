//
//  VlogMacaronTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "VlogMacaronTypo.h"

@implementation VlogMacaronTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"Square",nil);
        self.fontName = @"NanumSquareOTFEB";
        self.textColor = UIColor.whiteColor;
        self.canChangeColor = true;
    }
    return self;
}

+(VlogMacaronTypo*)vlogMacaronTypo{
    
    VlogMacaronTypo* vlogMacaronTypo = [[self alloc] init];
    return vlogMacaronTypo;
    
}

@end
