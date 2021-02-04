//
//  ArrowSticker3.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "ArrowSticker3.h"

@implementation ArrowSticker3

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"arrowSticker3";
        self.backgroundImageName = @"arrowSticker3";
        self.tintColor = [UIColor blackColor];
    }
    return self;
}

+(ArrowSticker3*)arrowSticker3{
    
    ArrowSticker3* arrowSticker3 = [[self alloc] init];
    return arrowSticker3;
}

@end
