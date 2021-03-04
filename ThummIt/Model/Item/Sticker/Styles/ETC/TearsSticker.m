//
//  TearsSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "TearsSticker.h"

@implementation TearsSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"tearsSticker";
        self.backgroundImageName = @"tearsSticker";
        
    }
    return self;
}

+(TearsSticker*)tearsSticker{
    
    TearsSticker* tearsSticker = [[self alloc] init];
    return tearsSticker;
}

@end
