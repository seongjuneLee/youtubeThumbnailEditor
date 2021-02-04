//
//  NuclearSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "NuclearSticker.h"

@implementation NuclearSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"nuclearSticker";
        self.backgroundImageName = @"nuclearSticker";
        self.cannotChangeColor = true;
    }
    return self;
}

+(NuclearSticker*)nuclearSticker{
    
    NuclearSticker* nuclearSticker = [[self alloc] init];
    return nuclearSticker;
}



@end
