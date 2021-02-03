//
//  StartleSticker1.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "StartleSticker1.h"

@implementation StartleSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"startleSticker1";
        self.backgroundImageName = @"startleSticker1";
        self.tintColor = [UIColor redColor];
    }
    return self;
}

+(StartleSticker1*)startleSticker1{
    
    StartleSticker1* startleSticker1 = [[self alloc] init];
    return startleSticker1;
}

@end
