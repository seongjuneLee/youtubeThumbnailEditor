//
//  ArrowSticker7.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "ArrowSticker7.h"

@implementation ArrowSticker7

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"arrowSticker7";
        self.backgroundImageName = @"arrowSticker7";
        self.tintColor = [UIColor blackColor];
    }
    return self;
}

+(ArrowSticker7*)arrowSticker7{
    
    ArrowSticker7* arrowSticker7 = [[self alloc] init];
    return arrowSticker7;
}


@end
