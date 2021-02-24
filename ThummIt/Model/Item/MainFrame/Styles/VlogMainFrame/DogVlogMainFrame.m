//
//  DogVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "DogVlogMainFrame.h"

@implementation DogVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"dogVlogFrame";
        self.backgroundImageName = @"dogVlogFrame";
}
    return self;
    
}

+(DogVlogMainFrame*) dogVlogMainFrame{

DogVlogMainFrame* dogVlogMainFrame = [[self alloc] init];
    
return dogVlogMainFrame;
    
}

@end
