//
//  MedalBronzeSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "MedalBronzeSticker.h"

@implementation MedalBronzeSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"medalBronzeSticker";
        self.backgroundImageName = @"medalBronzeSticker";
        
    }
    return self;
}

+(MedalBronzeSticker*)medalBronzeSticker{
    
    MedalBronzeSticker* medalBronzeSticker = [[self alloc] init];
    return medalBronzeSticker;
}

@end

