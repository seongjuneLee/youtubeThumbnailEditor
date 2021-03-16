//
//  VolumeSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "VolumeSticker.h"

@implementation VolumeSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"volumeSticker";
        self.backgroundImageName = @"volumeSticker";
        
    }
    return self;
}

+(VolumeSticker *)volumeSticker{
    
    VolumeSticker *volumeSticker = [[self alloc] init];
    return volumeSticker;
}

@end
