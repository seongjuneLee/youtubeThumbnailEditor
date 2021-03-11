//
//  SinSeoYuGi1MainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "SinSeoYuGi1MainFrame.h"

@implementation SinSeoYuGi1MainFrame

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"sinseoyugiFrame1";
        self.backgroundImageName = @"sinseoyugiFrame1";
    }
    return self;
}

+(SinSeoYuGi1MainFrame *)sinSeoYuGi1MainFrame{
    
    SinSeoYuGi1MainFrame *sinSeoYuGi1MainFrame = [[self alloc] init];
    return sinSeoYuGi1MainFrame;
}

@end
