//
//  HeartSticker4.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "HeartSticker4.h"

@implementation HeartSticker4

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"heartSticker4";
        self.backgroundImageName = @"heartSticker4";
        self.tintColor = [UIColor colorWithRed:248/255.0 green:247/255.0 blue:183/255.0 alpha:1.0];
    }
    return self;
}

+(HeartSticker4*) heartSticker4{
    
    HeartSticker4* heartSticker4 = [[self alloc] init];
    return heartSticker4;
}

@end
