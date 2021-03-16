//
//  InfiniteChallengeLegend.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/27.
//

#import "InfiniteChallengeLegeno.h"

@implementation InfiniteChallengeLegeno

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"레게노",nil);
        self.fontName = @"S-CoreDream-9Black";
        self.textColor = [UIColor colorWithRed:43/255.0 green:254/255.0 blue:181/255.0 alpha:1];
        self.canChangeColor = true;
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderWidth = 6;
        borderAtt.borderColor = UIColor.blackColor;
        
        NSMutableArray *shadowAttributes = [self makeShadowWithColor:[UIColor blackColor] fromOffset:CGPointMake(1, 1) toOffset:CGPointMake(3, 3)];
        
        [self.bgTextAttributes addObjectsFromArray:@[borderAtt]];
        [self.bgTextAttributes addObjectsFromArray:shadowAttributes];

    }
    return self;
}

+(InfiniteChallengeLegeno*)infiniteChallengeLegeno{
    
    InfiniteChallengeLegeno* infiniteChallengeLegeno = [[self alloc] init];
    return infiniteChallengeLegeno;
    
}

@end
