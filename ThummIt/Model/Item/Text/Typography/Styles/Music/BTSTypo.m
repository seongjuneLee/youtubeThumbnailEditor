//
//  BTSTypo.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "BTSTypo.h"

@implementation BTSTypo

-(id)init{
    self = [super init];
    if (self) {
        self.name = NSLocalizedString(@"BTS",nil);
        self.fontName = @"HAN-YONG-UN";
        self.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
        self.canChangeColor = true;
        self.obliqueValue = 0.0;
    }
    return self;
}

+(BTSTypo *)btsTypo{
    BTSTypo *btsTypo = [[self alloc] init];
    
    return btsTypo;
    
}

@end
