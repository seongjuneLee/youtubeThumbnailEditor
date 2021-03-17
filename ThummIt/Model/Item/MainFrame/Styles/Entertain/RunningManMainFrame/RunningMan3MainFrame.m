//
//  RunningMan3MainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "RunningMan3MainFrame.h"

@implementation RunningMan3MainFrame

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"runningManFrame3";
        self.backgroundImageName = @"runningManFrame3";
    }
    return self;
}

+(RunningMan3MainFrame *)runningMan3MainFrame{
    
    RunningMan3MainFrame *runningMan3MainFrame = [[self alloc] init];
    return runningMan3MainFrame;
}

@end
