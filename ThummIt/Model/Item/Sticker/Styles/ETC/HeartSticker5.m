//
//  HeartSticker5.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "HeartSticker5.h"

@implementation HeartSticker5

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"heartSticker5";
        self.backgroundImageName = @"heartSticker5";
        self.tintColor = [UIColor redColor];
    }
    return self;
}

+(HeartSticker5*)heartSticker5{
    
    HeartSticker5* heartSticker5 = [[self alloc] init];
    return heartSticker5;
}

@end