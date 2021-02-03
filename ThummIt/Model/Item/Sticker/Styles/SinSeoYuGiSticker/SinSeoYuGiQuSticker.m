//
//  SinSeoYuGiQuSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "SinSeoYuGiQuSticker.h"

@implementation SinSeoYuGiQuSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"sinSeoYuGiQuSticker";
        self.backgroundImageName = @"sinSeoYuGiQuSticker";
        self.cannotChangeColor = true;
    }
    return self;
}

+(SinSeoYuGiQuSticker*)sinSeoYuGiQuSticker{
    
    SinSeoYuGiQuSticker* sinSeoYuGiQuSticker = [[self alloc] init];
    return sinSeoYuGiQuSticker;
}

@end
