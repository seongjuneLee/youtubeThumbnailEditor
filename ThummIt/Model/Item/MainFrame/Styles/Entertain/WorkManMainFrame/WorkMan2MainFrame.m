//
//  WorkMan2MainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "WorkMan2MainFrame.h"

@implementation WorkMan2MainFrame

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"workManFrame2";
        self.backgroundImageName = @"workManFrame2";
    }
    return self;
}

+(WorkMan2MainFrame *)workMan2MainFrame{
    
    WorkMan2MainFrame *workMan2MainFrame = [[self alloc] init];
    return workMan2MainFrame;
}

@end
