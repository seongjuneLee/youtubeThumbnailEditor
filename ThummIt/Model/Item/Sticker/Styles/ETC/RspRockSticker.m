//
//  RspRockSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "RspRockSticker.h"

@implementation RspRockSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"rspRockSticker";
        self.backgroundImageName = @"rspRockSticker";
        
    }
    return self;
}

+(RspRockSticker*)rspRockSticker{
    
    RspRockSticker* rspRockSticker = [[self alloc] init];
    return rspRockSticker;
}

@end
