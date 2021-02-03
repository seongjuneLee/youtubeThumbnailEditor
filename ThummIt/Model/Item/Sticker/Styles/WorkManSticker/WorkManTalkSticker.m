//
//  WorkManTalkSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "WorkManTalkSticker.h"

@implementation WorkManTalkSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"workManTalkSticker";
        self.backgroundImageName = @"workManTalkSticker";
        self.tintColor = [UIColor whiteColor];
    }
    return self;
}

+(WorkManTalkSticker*)workManTalkSticker{
    
    WorkManTalkSticker* workManTalkSticker = [[self alloc] init];
    return workManTalkSticker;
}

@end
