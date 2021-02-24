//
//  SinSeoYuGi2MainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "SinSeoYuGi2MainFrame.h"

@implementation SinSeoYuGi2MainFrame

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"sinseoyugiFrame2";
        self.backgroundImageName = @"sinseoyugiFrame2";
        self.cannotChangeColor = true;
    }
    return self;
}

+(SinSeoYuGi2MainFrame *)sinSeoYuGi2MainFrame{
    
    SinSeoYuGi2MainFrame* sinSeoYuGi2MainFrame = [[self alloc] init];
    return sinSeoYuGi2MainFrame;
}

@end
