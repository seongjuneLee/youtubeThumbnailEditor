//
//  KoreanFlagSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "KoreanFlagSticker.h"

@implementation KoreanFlagSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"koreanFlagSticker";
        self.backgroundImageName = @"koreanFlagSticker";
        self.cannotChangeColor = true;
    }
    return self;
}

+(KoreanFlagSticker*)koreanFlagSticker{
    
    KoreanFlagSticker* koreanFlagSticker = [[self alloc] init];
    return koreanFlagSticker;
}

@end
