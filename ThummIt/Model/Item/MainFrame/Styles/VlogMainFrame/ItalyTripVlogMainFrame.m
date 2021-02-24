//
//  ItalyTripVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "ItalyTripVlogMainFrame.h"

@implementation ItalyTripVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"italyTripVlogFrame";
        self.backgroundImageName = @"italyTripVlogFrame";
    //    self.cannotChangeColor = true;
}
    return self;
}

+(ItalyTripVlogMainFrame*) italyTripVlogMainFrame{

ItalyTripVlogMainFrame *italyTripVlogMainFrame = [[self alloc] init];
    
return italyTripVlogMainFrame;
    
}

@end
