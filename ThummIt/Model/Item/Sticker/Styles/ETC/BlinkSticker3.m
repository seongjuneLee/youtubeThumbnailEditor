//
//  BlinkSticker3.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "BlinkSticker3.h"

@implementation BlinkSticker3

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"blinkSticker3";
        self.backgroundImageName = @"blinkSticker3";
        self.tintColor = [UIColor colorWithRed:252/255.0 green:203/255.0 blue:85/255.0 alpha:1.0];
    }
    return self;
}

+(BlinkSticker3*)blinkSticker3{
    
    BlinkSticker3* blinkSticker3 = [[self alloc] init];
    return blinkSticker3;
}

@end
