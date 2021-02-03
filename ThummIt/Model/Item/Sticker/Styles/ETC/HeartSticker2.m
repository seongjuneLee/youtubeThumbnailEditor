//
//  HeartSticker2.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "HeartSticker2.h"

@implementation HeartSticker2

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"heartSticker2";
        self.backgroundImageName = @"heartSticker2";
        self.tintColor = [UIColor redColor];

    }
    return self;
}

+(HeartSticker2*)heartSticker2{
    
    HeartSticker2* heartSticker2 = [[self alloc] init];
    return heartSticker2;
}

@end
