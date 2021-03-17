//
//  NextSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "NextSticker.h"

@implementation NextSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"nextSticker";
        self.backgroundImageName = @"nextSticker";
        
    }
    return self;
}

+(NextSticker *)nextSticker{
    
    NextSticker *nextSticker = [[self alloc] init];
    return nextSticker;
}


@end
