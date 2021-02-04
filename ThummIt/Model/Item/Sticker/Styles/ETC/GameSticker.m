//
//  GameSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "GameSticker.h"

@implementation GameSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"gameSticker";
        self.backgroundImageName = @"gameSticker";
        self.tintColor = [UIColor colorWithRed:0/255 green:0/255 blue:0/255 alpha:1];
    }
    return self;
}

+(GameSticker*)gameSticker{
    
    GameSticker* gameSticker = [[self alloc] init];
    return gameSticker;
}

@end
