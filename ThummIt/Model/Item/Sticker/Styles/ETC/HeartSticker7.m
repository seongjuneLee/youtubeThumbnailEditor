//
//  HeartSticker7.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "HeartSticker7.h"

@implementation HeartSticker7

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"heartSticker7";
        self.backgroundImageName = @"heartSticker7";
        
    }
    return self;
}

+(HeartSticker7*)heartSticker7{
    
    HeartSticker7* heartSticker7 = [[self alloc] init];
    return heartSticker7;
}

@end
