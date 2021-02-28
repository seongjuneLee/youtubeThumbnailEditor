//
//  HeartSticker6.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "HeartSticker6.h"

@implementation HeartSticker6

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"heartSticker6";
        self.backgroundImageName = @"heartSticker6";
        self.tintColor = [UIColor redColor];
        self.canChangeColor = true;
    }
    return self;
}

+(HeartSticker6*)heartSticker6{
    
    HeartSticker6* heartSticker6 = [[self alloc] init];
    return heartSticker6;
}

@end
