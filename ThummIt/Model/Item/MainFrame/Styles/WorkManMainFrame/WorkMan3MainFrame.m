//
//  WorkMan3MainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "WorkMan3MainFrame.h"

@implementation WorkMan3MainFrame

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"workManFrame3";
        self.backgroundImageName = @"workManFrame3";
        self.cannotChangeColor = true;
    }
    return self;
}

+(WorkMan3MainFrame *)workMan3MainFrame{
    
    WorkMan3MainFrame *workMan3MainFrame = [[self alloc] init];
    return workMan3MainFrame;
}

@end
