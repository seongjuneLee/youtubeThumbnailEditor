//
//  WorkManAngry.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "WorkManAngrySticker.h"

@implementation WorkManAngrySticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"workManAngrySticker";
        self.backgroundImageName = @"workManAngrySticker";
        self.tintColor = [UIColor redColor];
    }
    return self;
}

+(WorkManAngrySticker*)workManAngrySticker{
    
    WorkManAngrySticker* workManAngrySticker = [[self alloc] init];
    return workManAngrySticker;
}


@end
