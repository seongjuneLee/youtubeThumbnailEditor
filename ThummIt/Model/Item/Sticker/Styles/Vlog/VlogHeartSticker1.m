//
//  VlogHeartSticker1.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "VlogHeartSticker1.h"

@implementation VlogHeartSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"vlogHeartSticker1";
        self.backgroundImageName = @"vlogHeartSticker1";

    }
    return self;
}

+(VlogHeartSticker1*) vlogHeartSticker1{
    
    VlogHeartSticker1* vlogHeartSticker1 = [[self alloc] init];
    return vlogHeartSticker1;
}

@end
