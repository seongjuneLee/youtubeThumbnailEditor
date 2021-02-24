//
//  WebDesignerVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "WebDesignerVlogMainFrame.h"

@implementation WebDesignerVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"webDesignerVlogFrame";
        self.backgroundImageName = @"webDesignerVlogFrame";
    //    self.cannotChangeColor = true;
    }
    return self;
}

+(WebDesignerVlogMainFrame*) webDesignerVlogMainFrame{

    WebDesignerVlogMainFrame* webDesignerVlogMainFrame = [[self alloc] init];
    
return webDesignerVlogMainFrame;
    
}

@end
