//
//  ButtonPlaySticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "ButtonPlaySticker.h"

@implementation ButtonPlaySticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"buttonPlaySticker";
        self.backgroundImageName = @"buttonPlaySticker";
        self.tintColor = [UIColor blackColor];
    }
    return self;
}

+(ButtonPlaySticker*)buttonPlaySticker{
    
    ButtonPlaySticker* buttonPlaySticker = [[self alloc] init];
    return buttonPlaySticker;
}

@end
