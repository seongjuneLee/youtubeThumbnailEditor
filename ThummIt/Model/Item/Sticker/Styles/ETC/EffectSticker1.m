//
//  EffectSticker1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "EffectSticker1.h"

@implementation EffectSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"effectSticker1";
        self.backgroundImageName = @"effectSticker1";
        self.tintColor = [UIColor whiteColor];
    }
    return self;
}

+(EffectSticker1*)effectSticker1{
    
    EffectSticker1* effectSticker1 = [[self alloc] init];
    return effectSticker1;
}


@end
