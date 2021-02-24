//
//  StudentVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "StudentVlogMainFrame.h"

@implementation StudentVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"studentVlogFrame";
        self.backgroundImageName = @"studentVlogFrame";
    }
    return self;
}

+(StudentVlogMainFrame*) studentVlogMainFrame{

StudentVlogMainFrame *studentVlogMainFrame = [[self alloc] init];
    
return studentVlogMainFrame;
    
}

@end
