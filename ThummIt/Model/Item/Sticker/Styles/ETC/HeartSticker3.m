//
//  HeartSticker3.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "HeartSticker3.h"

@implementation HeartSticker3

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"heartSticker3";
        self.backgroundImageName = @"heartSticker3";
        self.tintColor = [UIColor  colorWithRed:255/255.0 green:112/255.0 blue:255/255.0 alpha:1.0];

    }
    return self;
}

+(HeartSticker3*) heartSticker3{
    
    HeartSticker3* heartSticker3 = [[self alloc] init];
    return heartSticker3;
}

@end
