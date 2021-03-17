//
//  LalaLandPlaySticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/12.
//

#import "LalaLandPlaySticker.h"

@implementation LalaLandPlaySticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"lalaLandPlaySticker";
        self.backgroundImageName = @"lalaLandPlaySticker";
        
    }
    return self;
}

+(LalaLandPlaySticker *)lalaLandPlaySticker{
    
    LalaLandPlaySticker *lalaLandPlaySticker = [[self alloc] init];
    return lalaLandPlaySticker;
}

@end
