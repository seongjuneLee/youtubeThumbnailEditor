//
//  XSticker.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/14.
//

#import "XSticker.h"

@implementation XSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"xSticker";
        self.backgroundImageName = @"xStickerRed";
    }
    return self;
}

+(XSticker*)xSticker{
    
    XSticker* xSticker = [[self alloc] init];
    return xSticker;
}

@end
