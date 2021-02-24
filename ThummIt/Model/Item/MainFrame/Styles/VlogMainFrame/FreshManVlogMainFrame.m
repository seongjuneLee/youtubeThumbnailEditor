//
//  FreshManVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "FreshManVlogMainFrame.h"

@implementation FreshManVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"freshmanVlogFrame";
        self.backgroundImageName = @"freshmanVlogFrame";
}
    return self;
}

+(FreshManVlogMainFrame*) freshManVlogMainFrame{

FreshManVlogMainFrame* freshManVlogMainFrame = [[self alloc] init];
    
return freshManVlogMainFrame;
    
}

@end
