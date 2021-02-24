//
//  TeenVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "TeenVlogMainFrame.h"

@implementation TeenVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"teenVlogFrame";
        self.backgroundImageName = @"teenVlogFrame";
    //    self.cannotChangeColor = true;
    }
    return self;
}

+(TeenVlogMainFrame*) teenVlogMainFrame{

TeenVlogMainFrame *teenVlogMainFrame = [[self alloc] init];
    
return teenVlogMainFrame;
    
}

@end
