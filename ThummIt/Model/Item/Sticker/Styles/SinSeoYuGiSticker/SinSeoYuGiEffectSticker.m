//
//  SinSeoYuGiEffectSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "SinSeoYuGiEffectSticker.h"

@implementation SinSeoYuGiEffectSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"sinSeoYuGiEffectSticker";
        self.backgroundImageName = @"sinSeoYuGiEffectSticker";
    }
    return self;
}

+(SinSeoYuGiEffectSticker*)sinSeoYuGiEffectSticker{
    
    SinSeoYuGiEffectSticker* sinSeoYuGiEffectSticker = [[self alloc] init];
    return sinSeoYuGiEffectSticker;
}

@end
