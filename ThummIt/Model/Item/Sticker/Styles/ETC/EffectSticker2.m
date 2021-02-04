//
//  EffectSticker2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "EffectSticker2.h"

@implementation EffectSticker2

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"effectSticker2";
        self.backgroundImageName = @"effectSticker2";
        self.tintColor = [UIColor blackColor];
    }
    return self;
}

+(EffectSticker2*)effectSticker2{
    
    EffectSticker2* effectSticker2 = [[self alloc] init];
    return effectSticker2;
}

@end
