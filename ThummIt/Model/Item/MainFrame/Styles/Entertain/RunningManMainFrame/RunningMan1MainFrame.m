//
//  RunningMan1MainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "RunningMan1MainFrame.h"

@implementation RunningMan1MainFrame

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"runningManFrame1";
        self.backgroundImageName = @"runningManFrame1";
    }
    return self;
}

+(RunningMan1MainFrame *)runningMan1MainFrame{
    
    RunningMan1MainFrame *runningMan1MainFrame = [[self alloc] init];
    return runningMan1MainFrame;
}

@end
