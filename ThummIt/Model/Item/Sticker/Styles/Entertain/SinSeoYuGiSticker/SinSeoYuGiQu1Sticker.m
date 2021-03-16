//
//  SinSeoYuGiQu1Sticker.m
//  ThummIt
//
//  Created by 조재훈 on 2021/02/04.
//

#import "SinSeoYuGiQu1Sticker.h"

@implementation SinSeoYuGiQu1Sticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"sinSeoYuGiQu1Sticker";
        self.backgroundImageName = @"sinSeoYuGiQu1Sticker";
        
    }
    return self;
}

+(SinSeoYuGiQu1Sticker*)sinSeoYuGiQu1Sticker{
    
    SinSeoYuGiQu1Sticker* sinSeoYuGiQu1Sticker = [[self alloc] init];
    return sinSeoYuGiQu1Sticker;
}

@end
