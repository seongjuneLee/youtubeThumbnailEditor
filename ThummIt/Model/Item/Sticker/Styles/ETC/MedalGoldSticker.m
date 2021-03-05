//
//  MedalGoldSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "MedalGoldSticker.h"

@implementation MedalGoldSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"medalGoldSticker";
        self.backgroundImageName = @"medalGoldSticker";
        
    }
    return self;
}

+(MedalGoldSticker*)medalGoldSticker{
    
    MedalGoldSticker* medalGoldSticker = [[self alloc] init];
    return medalGoldSticker;
}

@end
