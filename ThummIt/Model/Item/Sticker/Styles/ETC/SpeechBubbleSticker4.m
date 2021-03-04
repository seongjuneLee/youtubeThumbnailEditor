//
//  SpeechBubbleSticker4.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "SpeechBubbleSticker4.h"

@implementation SpeechBubbleSticker4

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"speechBubbleSticker4";
        self.backgroundImageName = @"speechBubbleSticker4";
        
    }
    return self;
}

+(SpeechBubbleSticker4*)speechBubbleSticker4{
    
    SpeechBubbleSticker4* speechBubbleSticker4 = [[self alloc] init];
    return speechBubbleSticker4;
}

@end
