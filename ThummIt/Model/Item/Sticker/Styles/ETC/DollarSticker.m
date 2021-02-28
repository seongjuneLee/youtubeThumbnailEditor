//
//  DollarSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "DollarSticker.h"

@implementation DollarSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"dollarSticker";
        self.backgroundImageName = @"dollarSticker";
        self.tintColor = [UIColor colorWithRed:99/255.0 green:181/255.0 blue:104/255.0 alpha:1];
        self.canChangeColor = true;
    }
    return self;
}

+(DollarSticker*)dollarSticker{
    
    DollarSticker* dollarSticker = [[self alloc] init];
    return dollarSticker;
}

@end
