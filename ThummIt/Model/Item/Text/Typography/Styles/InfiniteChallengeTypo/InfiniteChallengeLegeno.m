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
        self.fontSize = TEXT_FONT_SIZE + 20;
        
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.borderWidth = 10;
        attribute.borderColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
        
        self.bgTextAttributes = @[attribute];
    }
    return self;
}

+(InfiniteChallengeLegeno*)infiniteChallengeLegeno{
    
    InfiniteChallengeLegeno* infiniteChallengeLegeno = [[self alloc] init];
    return infiniteChallengeLegeno;
    
}

@end
