//
//  SixToFourVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "SixToFourVlogMainFrame.h"

@implementation SixToFourVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"sixToFourVlogFrame";
        self.backgroundImageName = @"sixToFourVlogFrame";
    //    self.cannotChangeColor = true;
    }
    return self;
}

+(SixToFourVlogMainFrame*) sixToFourVlogMainFrame{

SixToFourVlogMainFrame *sixToFourVlogMainFrame = [[self alloc] init];
    
return sixToFourVlogMainFrame;
    
}

@end
