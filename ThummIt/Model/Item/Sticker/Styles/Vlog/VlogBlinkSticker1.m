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
        self.tintColor = [UIColor colorWithRed:1.0 green:201/255.0 blue:91/255.0 alpha:1.0];

    }
    return self;
}

+(VlogBlinkSticker1*) vlogBlinkSticker1{
    
    VlogBlinkSticker1* vlogBlinkSticker1 = [[self alloc] init];
    return vlogBlinkSticker1;
}

@end
