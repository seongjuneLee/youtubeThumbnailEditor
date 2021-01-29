//
//  VlogHeartSticker3.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "VlogHeartSticker3.h"

@implementation VlogHeartSticker3

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"vlogHeartSticker3";
        self.backgroundImageName = @"vlogHeartSticker3";

    }
    return self;
}

+(VlogHeartSticker3*) vlogHeartSticker3{
    
    VlogHeartSticker3* vlogHeartSticker3 = [[self alloc] init];
    return vlogHeartSticker3;
}

@end
