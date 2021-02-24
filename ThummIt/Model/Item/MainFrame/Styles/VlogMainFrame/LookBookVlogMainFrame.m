//
//  LookBookVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "LookBookVlogMainFrame.h"

@implementation LookBookVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"lookBookVlogFrame";
        self.backgroundImageName = @"lookBookVlogFrame";
    }
    return self;
}

+(LookBookVlogMainFrame*) lookBookVlogMainFrame{

LookBookVlogMainFrame *lookBookVlogMainFrame = [[self alloc] init];
    
return lookBookVlogMainFrame;
    
}

@end
