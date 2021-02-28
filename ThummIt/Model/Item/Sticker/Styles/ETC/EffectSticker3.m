//
//  EffectSticker3.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "EffectSticker3.h"

@implementation EffectSticker3

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"effectSticker3";
        self.backgroundImageName = @"effectSticker3";
        self.tintColor = [UIColor whiteColor];
        self.canChangeColor = true;
    }
    return self;
}

+(EffectSticker3*)effectSticker3{
    
    EffectSticker3* effectSticker3 = [[self alloc] init];
    return effectSticker3;
}

@end
