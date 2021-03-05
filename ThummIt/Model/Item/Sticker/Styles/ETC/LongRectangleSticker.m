//
//  BasickRectangleSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/07.
//

#import "LongRectangleSticker.h"

@implementation LongRectangleSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"LongRectangleSticker";
        self.backgroundImageName = @"rectangleSticker";
        self.tintColor = UIColor.whiteColor;
        self.canChangeColor = true;
    }
    return self;
}

+(LongRectangleSticker*)longRectangleSticker{
    
    LongRectangleSticker* longRectangleSticker = [[self alloc] init];
    return longRectangleSticker;
}

@end
