//
//  CraftVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "CraftVlogMainFrame.h"

@implementation CraftVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"craftVlogFrame";
        self.backgroundImageName = @"craftVlogFrame";
}
    return self;
}

+(CraftVlogMainFrame*) craftVlogMainFrame{

CraftVlogMainFrame *craftVlogMainFrame = [[self alloc] init];
    
return craftVlogMainFrame;
    
}

@end
