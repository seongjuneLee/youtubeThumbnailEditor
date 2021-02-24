//
//  SummerVlogMainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "SummerVlogMainFrame.h"

@implementation SummerVlogMainFrame

-(id)init{

    self = [super init];
    if(self){
        self.itemName = @"summerVlogFrame";
        self.backgroundImageName = @"summerVlogFrame";
    }
    return self;
}

+(SummerVlogMainFrame*) summerVlogMainFrame{

SummerVlogMainFrame *summerVlogMainFrame = [[self alloc] init];
    
return summerVlogMainFrame;
    
}

@end
