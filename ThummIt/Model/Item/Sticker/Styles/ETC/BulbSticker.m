//
//  BulbSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "BulbSticker.h"

@implementation BulbSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"bulbSticker";
        self.backgroundImageName = @"bulbSticker";
        self.tintColor = [UIColor colorWithRed:255/255 green:255/255 blue:0/255 alpha:1];;
    }
    return self;
}

+(BulbSticker*)bulbSticker{
    
    BulbSticker* bulbSticker = [[self alloc] init];
    return bulbSticker;
}

@end
