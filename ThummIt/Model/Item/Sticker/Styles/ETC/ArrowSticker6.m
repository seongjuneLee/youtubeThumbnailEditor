//
//  ArrowSticker6.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "ArrowSticker6.h"

@implementation ArrowSticker6

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"arrowSticker6";
        self.backgroundImageName = @"arrowSticker6";
        self.tintColor = [UIColor redColor];
        self.canChangeColor = true;
    }
    return self;
}

+(ArrowSticker6*)arrowSticker6{
    
    ArrowSticker6* arrowSticker6 = [[self alloc] init];
    return arrowSticker6;
}


@end
