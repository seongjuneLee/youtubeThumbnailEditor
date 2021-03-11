//
//  SinSeoYuGiQu2Sticker.m
//  ThummIt
//
//  Created by 조재훈 on 2021/02/04.
//

#import "SinSeoYuGiQu2Sticker.h"

@implementation SinSeoYuGiQu2Sticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"sinSeoYuGiQu2Sticker";
        self.backgroundImageName = @"sinSeoYuGiQu2Sticker";
        
    }
    return self;
}

+(SinSeoYuGiQu2Sticker*)sinSeoYuGiQu2Sticker{
    
    SinSeoYuGiQu2Sticker* sinSeoYuGiQu2Sticker = [[self alloc] init];
    return sinSeoYuGiQu2Sticker;
}

@end
