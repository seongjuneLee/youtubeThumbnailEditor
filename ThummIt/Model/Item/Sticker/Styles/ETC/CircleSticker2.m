//
//  CircleSticker2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "CircleSticker2.h"

@implementation CircleSticker2

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"circleSticker2";
        self.backgroundImageName = @"circleSticker2";
        self.tintColor = [UIColor redColor];
        self.canChangeColor = true;
    }
    return self;
}

+(CircleSticker2*)circleSticker2{
    
    CircleSticker2* circleSticker2 = [[self alloc] init];
    return circleSticker2;
}

@end
