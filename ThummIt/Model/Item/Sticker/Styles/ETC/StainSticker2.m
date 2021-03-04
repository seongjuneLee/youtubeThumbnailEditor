//
//  StainSticker2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "StainSticker2.h"

@implementation StainSticker2

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"stainSticker2";
        self.backgroundImageName = @"stainSticker2";
        self.tintColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
        self.canChangeColor = true;
    }
    return self;
}

+(StainSticker2*)stainSticker2{
    
    StainSticker2* stainSticker2 = [[self alloc] init];
    return stainSticker2;
}

@end
