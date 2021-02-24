//
//  InfiniteChallenge2MainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "InfiniteChallenge2MainFrame.h"

@implementation InfiniteChallenge2MainFrame

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"infiniteChallengeFrame2";
        self.backgroundImageName = @"infiniteChallengeFrame2";
        self.cannotChangeColor = true;
    }
    return self;
}

+(InfiniteChallenge2MainFrame *)infiniteChallenge2MainFrame{
    
    InfiniteChallenge2MainFrame *infiniteChallenge2MainFrame = [[self alloc] init];
    return infiniteChallenge2MainFrame;
}

@end
