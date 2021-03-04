//
//  ArrowSticker5.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "ArrowSticker5.h"

@implementation ArrowSticker5

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"arrowSticker5";
        self.backgroundImageName = @"arrowSticker5";
        self.tintColor = [UIColor redColor];
        self.canChangeColor = true;
    }
    return self;
}

+(ArrowSticker5*)arrowSticker5{
    
    ArrowSticker5* arrowSticker5 = [[self alloc] init];
    return arrowSticker5;
}

@end
