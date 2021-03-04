//
//  HeartSticker1.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "HeartSticker1.h"

@implementation HeartSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"heartSticker1";
        self.backgroundImageName = @"heartSticker1";
        self.tintColor = [UIColor colorWithRed:1.0 green:123/255.0 blue:255/255.0 alpha:1.0];
        self.canChangeColor = true;
    }
    return self;
}

+(HeartSticker1*) heartSticker1{
    
    HeartSticker1* heartSticker1 = [[self alloc] init];
    return heartSticker1;
}

@end
