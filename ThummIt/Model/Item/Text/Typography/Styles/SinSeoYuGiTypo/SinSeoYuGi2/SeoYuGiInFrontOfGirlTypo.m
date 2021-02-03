//
//  InFrontOfGirlTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "SeoYuGiInFrontOfGirlTypo.h"

@implementation SeoYuGiInFrontOfGirlTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"여사친 앞에서",nil);
        self.fontName = @"ELANDNiceM";
        self.fontSize = 30;
        self.textColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0 alpha:1 ];
        
        BGTextAttribute *bgTextAttribute1 = [[BGTextAttribute alloc] init];
        BGTextAttribute *bgTextAttribute2 = [[BGTextAttribute alloc] init];
        bgTextAttribute1.borderColor = [UIColor colorWithRed:84/255.0f green:8/255.0f blue:8/255.0f alpha:1];
        bgTextAttribute2.borderColor = [UIColor colorWithRed:145/255.0f green:69/255.0f blue:34/255.0f alpha:1];
        bgTextAttribute1.borderWidth = 8;
        bgTextAttribute2.borderWidth = 16;
        
        self.bgTextAttributes = @[bgTextAttribute1 , bgTextAttribute2];
    }
    
    return self;
}

+(SeoYuGiInFrontOfGirlTypo*) seoYuGiInFrontOfGirlTypo{
    
    SeoYuGiInFrontOfGirlTypo* seoYuGiInFrontOfGirlTypo = [[self alloc] init];
    return seoYuGiInFrontOfGirlTypo;
    
}

@end
