//
//  RspScissorsSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "RspScissorsSticker.h"

@implementation RspScissorsSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"rspScissorsSticker";
        self.backgroundImageName = @"rspScissorsSticker";
        
    }
    return self;
}

+(RspScissorsSticker*)rspScissorsSticker{
    
    RspScissorsSticker* rspScissorsSticker = [[self alloc] init];
    return rspScissorsSticker;
}

@end
