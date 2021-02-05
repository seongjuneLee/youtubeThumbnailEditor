//
//  VlogBMDohyunTypo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/29.
//

#import "VlogBMDohyunTypo.h"

@implementation VlogBMDohyunTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"배민도현",nil);
        self.fontName = @"BMDoHyeon-OTF";
        self.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        
    }
    return self;
}

+(VlogBMDohyunTypo*)vlogBMDohyunTypo{
    
    VlogBMDohyunTypo* vlogBMDohyunTypo = [[self alloc] init];
    return vlogBMDohyunTypo;
    
}

@end
