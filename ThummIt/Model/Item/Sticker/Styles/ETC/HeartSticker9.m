//
//  HeartSticker9.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "HeartSticker9.h"

@implementation HeartSticker9

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"heartSticker9";
        self.backgroundImageName = @"heartSticker9";
        self.tintColor = [UIColor colorWithRed:254/255.0 green:164/255.0 blue:128/255.0 alpha:1.0];
    }
    return self;
}

+(HeartSticker9*)heartSticker9{
    
    HeartSticker9* heartSticker9 = [[self alloc] init];
    return heartSticker9;
}

@end
