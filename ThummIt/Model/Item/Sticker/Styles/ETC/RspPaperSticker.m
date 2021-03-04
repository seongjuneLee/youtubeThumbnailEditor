//
//  RspPaperSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "RspPaperSticker.h"

@implementation RspPaperSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"rspPaperSticker";
        self.backgroundImageName = @"rspPaperSticker";
        
    }
    return self;
}

+(RspPaperSticker*)rspPaperSticker{
    
    RspPaperSticker* rspPaperSticker = [[self alloc] init];
    return rspPaperSticker;
}


@end
