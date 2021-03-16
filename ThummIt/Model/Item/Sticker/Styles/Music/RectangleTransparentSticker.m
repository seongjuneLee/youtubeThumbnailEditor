//
//  RectangleTransparentSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/12.
//

#import "RectangleTransparentSticker.h"

@implementation RectangleTransparentSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"rectangleTransparentSticker";
        self.backgroundImageName = @"rectangleTransparentSticker";
        
    }
    return self;
}

+(RectangleTransparentSticker *)rectangleTransparentSticker{
    
    RectangleTransparentSticker *rectangleTransparentSticker = [[self alloc] init];
    return rectangleTransparentSticker;
}


@end
