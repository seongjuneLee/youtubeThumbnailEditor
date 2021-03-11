//
//  InfiniteChallenge1MainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "InfiniteChallenge1MainFrame.h"

@implementation InfiniteChallenge1MainFrame

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"infiniteChallengeFrame1";
        self.backgroundImageName = @"infiniteChallengeFrame1";
    }
    return self;
}

+(InfiniteChallenge1MainFrame *)infiniteChallenge1MainFrame{
    
    InfiniteChallenge1MainFrame *infiniteChallenge1MainFrame = [[self alloc] init];
    return infiniteChallenge1MainFrame;
}

@end
