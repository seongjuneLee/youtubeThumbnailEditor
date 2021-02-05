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
        
        BGTextAttribute *borderAtt = [[BGTextAttribute alloc] init];
        borderAtt.borderWidth = 6;
        borderAtt.borderColor = UIColor.blackColor;
        
        BGTextAttribute *shadowAtt1 = [[BGTextAttribute alloc] init];
        shadowAtt1.shadowColor = UIColor.blackColor;
        shadowAtt1.shadowOffset = CGPointMake(0.5, 0.5);
        
        BGTextAttribute *shadowAtt2 = [[BGTextAttribute alloc] init];
        shadowAtt2.shadowColor = UIColor.blackColor;
        shadowAtt2.shadowOffset = CGPointMake(1, 1);
        
        BGTextAttribute *shadowAtt3 = [[BGTextAttribute alloc] init];
        shadowAtt3.shadowColor = UIColor.blackColor;
        shadowAtt3.shadowOffset = CGPointMake(1.5, 1.5);
        
        self.bgTextAttributes = @[borderAtt, shadowAtt1, shadowAtt2, shadowAtt3];
    }
    return self;
}

+(InfiniteChallengeLegeno*)infiniteChallengeLegeno{
    
    InfiniteChallengeLegeno* infiniteChallengeLegeno = [[self alloc] init];
    return infiniteChallengeLegeno;
    
}

@end
