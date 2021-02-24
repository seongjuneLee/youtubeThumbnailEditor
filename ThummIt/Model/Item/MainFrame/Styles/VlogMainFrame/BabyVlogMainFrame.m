//
//  BabyVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "BabyVlogMainFrame.h"

@implementation BabyVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"babyVlogFrame";
        self.backgroundImageName = @"babyVlogFrame";
        self.cannotChangeColor = true;
}
    return self;
}

+(BabyVlogMainFrame*) babyVlogMainFrame{

BabyVlogMainFrame* babyVlogMainFrame = [[self alloc] init];
    
return babyVlogMainFrame;
    
}

@end
