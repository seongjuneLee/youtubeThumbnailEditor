//
//  VlogBlinkSticker1.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "VlogBlinkSticker1.h"

@implementation VlogBlinkSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"blinkSticker1";
        self.backgroundImageName = @"blinkSticker1";

    }
    return self;
}

+(VlogBlinkSticker1*) vlogBlinkSticker1{
    
    VlogBlinkSticker1* vlogBlinkSticker1 = [[self alloc] init];
    return vlogBlinkSticker1;
}

@end
