//
//  InfiniteChallengeFiveMinutes.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "InfiniteChallengeFiveMinutes.h"

@implementation InfiniteChallengeFiveMinutes

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"오분순삭",nil);
        self.fontName = @"3YangPyeongB";
        self.textColor = [UIColor colorWithRed:255/255.0 green:205/255.0 blue:0/255.0 alpha:1.0];
        self.fontSize = 60;
        self.canChangeColor = true;
        NSMutableArray *shadowAttributes = [self makeShadowWithColor:[UIColor blackColor] fromOffset:CGPointMake(1, 1) toOffset:CGPointMake(3.8, 3.8)];
        [self.bgTextAttributes addObjectsFromArray:shadowAttributes];
 
    }
    return self;
}

+(InfiniteChallengeFiveMinutes*)infiniteChallengeFiveMinutes{
    
    InfiniteChallengeFiveMinutes* infiniteChallengeFiveMinutes = [[self alloc] init];
    return infiniteChallengeFiveMinutes;
    
}

@end
