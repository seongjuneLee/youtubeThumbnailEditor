//
//  AngrySticker1.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "AngrySticker1.h"

@implementation AngrySticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"angrySticker1";
        self.backgroundImageName = @"angrySticker1";
        self.tintColor = [UIColor redColor];
    }
    return self;
}

+(AngrySticker1*)angrySticker1{
    
    AngrySticker1* angrySticker1 = [[self alloc] init];
    return angrySticker1;
}


@end
