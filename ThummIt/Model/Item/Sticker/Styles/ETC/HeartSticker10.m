//
//  HeartSticker10.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "HeartSticker10.h"

@implementation HeartSticker10

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"heartSticker10";
        self.backgroundImageName = @"heartSticker10";
        self.tintColor = [UIColor colorWithRed:255/255 green:112/255 blue:255/255 alpha:1];
    }
    return self;
}

+(HeartSticker10*)heartSticker10{
    
    HeartSticker10* heartSticker10 = [[self alloc] init];
    return heartSticker10;
}

@end
