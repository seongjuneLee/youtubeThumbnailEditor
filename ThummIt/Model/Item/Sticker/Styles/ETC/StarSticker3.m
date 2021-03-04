//
//  StarSticker3.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "StarSticker3.h"

@implementation StarSticker3

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"starSticker3";
        self.backgroundImageName = @"starSticker3";
        self.tintColor = [UIColor colorWithRed:255/255.0 green:201/255.0 blue:91/255.0 alpha:1.0];
        self.canChangeColor = true;
    }
    return self;
}

+(StarSticker3*)starSticker3{
    
    StarSticker3* starSticker3 = [[self alloc] init];
    return starSticker3;
}

@end
