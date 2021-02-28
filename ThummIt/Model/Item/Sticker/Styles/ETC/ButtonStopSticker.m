//
//  ButtonStopSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "ButtonStopSticker.h"

@implementation ButtonStopSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"buttonStopSticker";
        self.backgroundImageName = @"buttonStopSticker";
        self.tintColor = [UIColor blackColor];
        self.canChangeColor = true;
    }
    return self;
}

+(ButtonStopSticker*)buttonStopSticker{
    
    ButtonStopSticker* buttonStopSticker = [[self alloc] init];
    return buttonStopSticker;
}

@end
