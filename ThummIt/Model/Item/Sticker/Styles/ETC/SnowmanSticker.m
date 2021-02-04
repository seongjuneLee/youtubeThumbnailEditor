//
//  SnowmanSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "SnowmanSticker.h"

@implementation SnowmanSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"snowmanSticker";
        self.backgroundImageName = @"snowmanSticker";
        self.cannotChangeColor = true;
    }
    return self;
}

+(SnowmanSticker*)snowmanSticker{
    
    SnowmanSticker* snowmanSticker = [[self alloc] init];
    return snowmanSticker;
}

@end
