//
//  HeartSticker8.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "HeartSticker8.h"

@implementation HeartSticker8

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"heartSticker8";
        self.backgroundImageName = @"heartSticker8";
        self.tintColor = [UIColor colorWithRed:255/255 green:123/255 blue:255/255 alpha:1];
    }
    return self;
}

+(HeartSticker8*)heartSticker8{
    
    HeartSticker8* heartSticker8 = [[self alloc] init];
    return heartSticker8;
}

@end
