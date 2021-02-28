//
//  BurstSticker1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "BurstSticker1.h"

@implementation BurstSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"burstSticker1";
        self.backgroundImageName = @"burstSticker1";
        self.tintColor = [UIColor colorWithRed:252/255.0 green:203/255.0 blue:85/255.0 alpha:1.0];
        self.canChangeColor = true;
    }
    return self;
}

+(BurstSticker1*)burstSticker1{
    
    BurstSticker1* burstSticker1 = [[self alloc] init];
    return burstSticker1;
}

@end
