//
//  MacaronVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "MacaronVlogMainFrame.h"

@implementation MacaronVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"macaronVlogFrame";
        self.backgroundImageName = @"macaronVlogFrame";
    }
    return self;
}

+(MacaronVlogMainFrame*) macaronVlogMainFrame{

MacaronVlogMainFrame* macaronVlogMainFrame = [[self alloc] init];
    
return macaronVlogMainFrame;
    
}

@end
