//
//  RetroPlaySticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/12.
//

#import "RetroPlaySticker.h"

@implementation RetroPlaySticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"retroPlaySticker";
        self.backgroundImageName = @"retroPlaySticker";
        
    }
    return self;
}

+(RetroPlaySticker *)retroPlaySticker{
    
    RetroPlaySticker *retroPlaySticker = [[self alloc] init];
    return retroPlaySticker;
}


@end
