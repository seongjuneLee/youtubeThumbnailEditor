//
//  RunningMan2MainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "RunningMan2MainFrame.h"

@implementation RunningMan2MainFrame

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"runningManFrame2";
        self.backgroundImageName = @"runningManFrame2";
        self.cannotChangeColor = true;
    }
    return self;
}

+(RunningMan2MainFrame *)runningMan2MainFrame{
    
    RunningMan2MainFrame *runningMan2MainFrame = [[self alloc] init];
    return runningMan2MainFrame;
}

@end
