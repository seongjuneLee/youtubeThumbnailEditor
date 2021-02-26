//
//  SinSeoYuGiExc2Sticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "SinSeoYuGiExc2Sticker.h"

@implementation SinSeoYuGiExc2Sticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"sinSeoYuGiExc2Sticker";
        self.backgroundImageName = @"SinSeoYuGiExc2Sticker";
        self.cannotChangeColor = true;
    }
    return self;
}

+(SinSeoYuGiExc2Sticker*)sinSeoYuGiExc2Sticker{
    
    SinSeoYuGiExc2Sticker* sinSeoYuGiExc2Sticker = [[self alloc] init];
    return sinSeoYuGiExc2Sticker;
}

@end
