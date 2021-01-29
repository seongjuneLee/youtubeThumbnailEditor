//
//  VlogHeartSticker2.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "VlogHeartSticker2.h"

@implementation VlogHeartSticker2

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"vlogHeartSticker2";
        self.backgroundImageName = @"vlogHeartSticker2";

    }
    return self;
}

+(VlogHeartSticker2*) vlogHeartSticker2{
    
    VlogHeartSticker2* vlogHeartSticker2 = [[self alloc] init];
    return vlogHeartSticker2;
}

@end
