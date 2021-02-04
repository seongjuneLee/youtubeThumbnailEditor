//
//  LockSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "LockSticker.h"

@implementation LockSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"lockSticker";
        self.backgroundImageName = @"lockSticker";
        self.tintColor = [UIColor colorWithRed:0/255 green:0/255 blue:0/255 alpha:1];
    }
    return self;
}

+(LockSticker*)lockSticker{
    
    LockSticker* lockSticker = [[self alloc] init];
    return lockSticker;
}


@end
