//
//  RectangleFrameSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/12.
//

#import "RectangleFrameSticker.h"

@implementation RectangleFrameSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"rectangleFrameSticker";
        self.backgroundImageName = @"rectangleFrameSticker";
        
    }
    return self;
}

+(RectangleFrameSticker *)rectangleFrameSticker{
    
    RectangleFrameSticker *rectangleFrameSticker = [[self alloc] init];
    return rectangleFrameSticker;
}


@end
