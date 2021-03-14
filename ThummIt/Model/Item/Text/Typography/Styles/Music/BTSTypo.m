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
        self.textColor = [UIColor whiteColor];
        self.canChangeColor = true;
        self.obliqueValue = 0.25;
        
        BGTextAttribute *shadow = [[BGTextAttribute alloc] init];
        shadow.shadowOffset = CGPointMake(3, 3);
        shadow.shadowColor = [UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1.0];
        shadow.obliqueValue = 0.25;
        
        self.bgTextAttributes = @[shadow];

    }
    return self;
}

+(BTSTypo *)btsTypo{
    BTSTypo *btsTypo = [[self alloc] init];
    
    return btsTypo;
    
}

@end
