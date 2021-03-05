//
//  SpeechBubbleSticker3.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "SpeechBubbleSticker3.h"

@implementation SpeechBubbleSticker3

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"speechBubbleSticker3";
        self.backgroundImageName = @"speechBubbleSticker3";
        self.tintColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        self.canChangeColor = true;
    }
    return self;
}

+(SpeechBubbleSticker3*)speechBubbleSticker3{
    
    SpeechBubbleSticker3* speechBubbleSticker3 = [[self alloc] init];
    return speechBubbleSticker3;
}

@end
