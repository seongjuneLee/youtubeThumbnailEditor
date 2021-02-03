//
//  SinSeoYuGiExc1Sticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "SinSeoYuGiExc1Sticker.h"

@implementation SinSeoYuGiExc1Sticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"sinSeoYuGiExc1Sticker";
        self.backgroundImageName = @"sinSeoYuGiExc1Sticker";
        self.cannotChangeColor = true;
    }
    return self;
}

+(SinSeoYuGiExc1Sticker*) sinSeoYuGiExc1Sticker{
    
    SinSeoYuGiExc1Sticker* sinSeoYuGiExc1Sticker = [[self alloc] init];
    return sinSeoYuGiExc1Sticker;
}

@end
