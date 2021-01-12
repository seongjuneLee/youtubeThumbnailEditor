//
//  BasicCircleSticker.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/13.
//

#import "BasicCircleSticker.h"

@implementation BasicCircleSticker

-(id) init{
    
    self = [super init];
    if(self){
        self.backgroundImageName = @"basicCircleSticker";
    }
    return self;
    
}

+(BasicCircleSticker*)basicCircleSticker{
    
    BasicCircleSticker* basicCircleSticker = [[self alloc] init];
    return basicCircleSticker;
    
}


@end
