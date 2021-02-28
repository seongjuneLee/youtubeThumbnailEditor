//
//  StarSticker2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "StarSticker2.h"

@implementation StarSticker2

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"starSticker2";
        self.backgroundImageName = @"starSticker2";
        self.tintColor = [UIColor colorWithRed:255/255.0 green:201/255.0 blue:91/255.0 alpha:1.0];
        self.canChangeColor = true;
    }
    return self;
}

+(StarSticker2*)starSticker2{
    
    StarSticker2* starSticker2 = [[self alloc] init];
    return starSticker2;
}

@end
