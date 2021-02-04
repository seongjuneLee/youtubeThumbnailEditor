//
//  MedalSilverSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "MedalSilverSticker.h"

@implementation MedalSilverSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"medalSilverSticker";
        self.backgroundImageName = @"medalSilverSticker";
        self.cannotChangeColor = true;
    }
    return self;
}

+(MedalSilverSticker*)medalSilverSticker{
    
    MedalSilverSticker* medalSilverSticker = [[self alloc] init];
    return medalSilverSticker;
}

@end

