//
//  GoodSticker1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "GoodSticker1.h"

@implementation GoodSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"goodSticker1";
        self.backgroundImageName = @"goodSticker1";
        self.tintColor = [UIColor blackColor];
    }
    return self;
}

+(GoodSticker1*)goodSticker1{
    
    GoodSticker1* goodSticker1 = [[self alloc] init];
    return goodSticker1;
}

@end
