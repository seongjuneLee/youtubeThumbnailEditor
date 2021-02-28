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
        self.tintColor = [UIColor  colorWithRed:254/255.0 green:134/255.0 blue:128/255.0 alpha:1.0];
        self.canChangeColor = true;
    }
    return self;
}

+(HeartSticker4*) heartSticker4{
    
    HeartSticker4* heartSticker4 = [[self alloc] init];
    return heartSticker4;
}

@end
