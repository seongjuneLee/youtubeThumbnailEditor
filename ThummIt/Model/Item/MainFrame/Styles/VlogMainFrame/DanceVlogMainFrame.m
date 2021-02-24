//
//  DanceVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "DanceVlogMainFrame.h"

@implementation DanceVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"danceVlogFrame";
        self.backgroundImageName = @"danceVlogFrame";
}
    return self;
    
}

+(DanceVlogMainFrame*) danceVlogMainFrame{

DanceVlogMainFrame* danceVlogMainFrame = [[self alloc] init];
    
return danceVlogMainFrame;
    
}

@end
