//
//  StarSticker4.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "StarSticker4.h"

@implementation StarSticker4

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"starSticker4";
        self.backgroundImageName = @"starSticker4";
        self.tintColor = [UIColor colorWithRed:255/255.0 green:201/255.0 blue:91/255.0 alpha:1.0];
    }
    return self;
}

+(StarSticker4*)starSticker4{
    
    StarSticker4* starSticker4 = [[self alloc] init];
    return starSticker4;
}

@end
