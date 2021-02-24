//
//  WorkMan1MainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "WorkMan1MainFrame.h"

@implementation WorkMan1MainFrame
    
-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"workManFrame1";
        self.backgroundImageName = @"workManFrame1";
        self.cannotChangeColor = true;
    }
    return self;
}

+(WorkMan1MainFrame *)workMan1MainFrame{
    
    WorkMan1MainFrame* workMan1MainFrame = [[self alloc] init];
    return workMan1MainFrame;
}

@end
