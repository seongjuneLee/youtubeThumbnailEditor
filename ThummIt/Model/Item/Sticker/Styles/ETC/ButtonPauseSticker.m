//
//  ButtonPauseSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "ButtonPauseSticker.h"

@implementation ButtonPauseSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"buttonPauseSticker";
        self.backgroundImageName = @"buttonPauseSticker";
        self.tintColor = [UIColor blackColor];
        self.canChangeColor = true;
    }
    return self;
}

+(ButtonPauseSticker*)buttonPauseSticker{
    
    ButtonPauseSticker* buttonPauseSticker = [[self alloc] init];
    return buttonPauseSticker;
}

@end
