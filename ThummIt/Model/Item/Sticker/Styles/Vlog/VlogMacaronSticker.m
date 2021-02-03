//
//  VlogMacaronSticker.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "VlogMacaronSticker.h"

@implementation VlogMacaronSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"vlogMacaronSticker";
        self.backgroundImageName = @"vlogMacaronSticker";
        self.cannotChangeColor = true;

    }
    return self;
}

+(VlogMacaronSticker*) vlogMacaronSticker{
    
    VlogMacaronSticker* vlogMacaronSticker = [[self alloc] init];
    return vlogMacaronSticker;
}

@end
