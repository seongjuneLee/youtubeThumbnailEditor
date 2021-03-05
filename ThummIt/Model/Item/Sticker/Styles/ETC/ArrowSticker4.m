//
//  ArrowSticker4.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "ArrowSticker4.h"

@implementation ArrowSticker4

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"arrowSticker4";
        self.backgroundImageName = @"arrowSticker4";
        self.tintColor = [UIColor blackColor];
        self.canChangeColor = true;
    }
    return self;
}

+(ArrowSticker4*)arrowSticker4{
    
    ArrowSticker4* arrowSticker4 = [[self alloc] init];
    return arrowSticker4;
}


@end
