//
//  RunningManQuSticker.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "RunningManQuSticker.h"

@implementation RunningManQuSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"runningManQuSticker";
        self.backgroundImageName = @"runningManQuSticker";
        self.cannotChangeColor = true;
    }
    return self;
}

+(RunningManQuSticker*)runningManQuSticker{
    
    RunningManQuSticker* runningManQuSticker = [[self alloc] init];
    return runningManQuSticker;
}


@end
