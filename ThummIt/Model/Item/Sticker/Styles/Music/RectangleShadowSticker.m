//
//  RectangleShadowSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "RectangleShadowSticker.h"

@implementation RectangleShadowSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"rectangleShadowSticker";
        self.backgroundImageName = @"rectangleShadowSticker";
        
    }
    return self;
}

+(RectangleShadowSticker *)rectangleShadowSticker{
    
    RectangleShadowSticker *rectangleShadowSticker = [[self alloc] init];
    return rectangleShadowSticker;
}

@end
