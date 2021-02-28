//
//  StarSticker1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "StarSticker1.h"

@implementation StarSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"starSticker1";
        self.backgroundImageName = @"starSticker1";
        self.tintColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:0/255.0 alpha:1.0];
        self.canChangeColor = true;
    }
    return self;
}

+(StarSticker1*)starSticker1{
    
    StarSticker1* starSticker1 = [[self alloc] init];
    return starSticker1;
}

@end
