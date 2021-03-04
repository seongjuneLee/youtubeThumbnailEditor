//
//  StainSticker1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "StainSticker1.h"

@implementation StainSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"stainSticker1";
        self.backgroundImageName = @"stainSticker1";
        self.tintColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
        self.canChangeColor = true;
    }
    return self;
}

+(StainSticker1*)stainSticker1{
    
    StainSticker1* stainSticker1 = [[self alloc] init];
    return stainSticker1;
}

@end
